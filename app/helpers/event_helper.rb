module EventHelper
  def materials_url(url)
    url.gsub(/export=download\z/, "")
  end
end
