module ApplicationHelper
  def main_menu
    active_year, active_conference = 
      if @conference
        [@conference.year, @conference]
      elsif @year
        [@year, nil]
      else
        [MainMenu.last_year, nil]
      end
    next_conference, previous_conference = 
      if active_conference
        [
          next_conference_for(active_conference),
          previous_conference_for(active_conference)
        ]
      else
        [nil, nil]
      end

    content_tag(:div, class: 'main-menu') do
      concat(
        content_tag(:div, class: 'col-lg-12') do
          concat(
            content_tag(:ul, class: 'nav nav-pills', id: 'conference_nav_buttons') do
              MainMenu.years.map do |year|
                concat(
                  content_tag(:li, class: active_year == year ? 'active' : nil) do
                    link_to year.name.to_s, year_events_path(year.name)
                  end
                )
              end
            end
          )
        end
      )

      #navigation
      concat(
        content_tag(:div, class: 'row') do
          content_tag(:div, class: 'col-lg-12') do
            content_tag(:ul, class: 'navigation') do
              if previous_conference
                concat(
                  content_tag(:li, class: 'previous') do
                    link_to about_conference_path(previous_conference.route) do
                      content_tag(:div)
                    end
                  end
                )
              end
              concat(
                content_tag(:ul, class: 'conferences') do
                  Conference.year(active_year).by_date_asc.each do |conf|
                    if can? :read, conf
                      concat(
                        link_to(about_conference_path(conf.route)) do
                          content_tag(:li, class: [conf == active_conference ? 'active' : nil, publishing_status(conf)]) do
                            content_tag(:span, conf.name, class: 'vertical-center')
                          end
                        end
                      )
                    end
                  end
                end
              )
              if next_conference
                concat(
                  content_tag(:li, class: 'next') do
                    link_to about_conference_path(next_conference.route) do
                      content_tag(:div)
                    end
                  end
                )
              end
            end
          end
        end
      )
    end
  end
end
