class Admin::ConfigurationsController < ApplicationController
  before_action :set_configuration, only: [:edit, :update]
  before_action :authenticate_admin!
  layout 'admin' 

  # GET /admin/configurations/1/edit
  def edit
  end

  # PATCH/PUT /admin/configurations/1
  # PATCH/PUT /admin/configurations/1.json
  def update
    respond_to do |format|
      if @configuration.update(configuration_params)
        format.html { redirect_to edit_admin_configurations_path, notice: 'Configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration }
      else
        format.html { render :edit }
        format.json { render json: @configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration
      @configuration = Admin::Configuration.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_params
      params.require(:configuration).permit(:apply_date_validation)
    end
end
