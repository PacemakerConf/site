class YearsController < ApplicationController
  before_action :set_year, only: :show
  before_action :check_visibility, only: :show

  def show
  end

  private

	  def check_visibility
	    unless can? :read, @year
	      not_found
	    end
	  end

    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.where(name: params[:name])[0]
    end

end
