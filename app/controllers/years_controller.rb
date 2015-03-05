class YearsController < ApplicationController
  before_action :set_year, only: :show

  def show
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.where(name: params[:name])[0]
    end

end
