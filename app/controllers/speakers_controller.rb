class SpeakersController < ApplicationController

  before_action :set_speaker, only: [:show, :edit, :update, :destroy]
 
  def show
    @conference = Conference.all.order(date: :desc)[0]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      if(params[:name].to_i.to_s === params[:name].to_s)
        @speaker = Speaker.find(params[:name])
      else
        @speaker = Speaker.where(name: params[:name])[0]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speaker_params
      params.require(:speaker).permit(:name, :surname, :description, :email, :facebook, :linkedin, :site)
    end

end