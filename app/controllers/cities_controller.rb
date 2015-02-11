class CitiesController < ApplicationController
  before_filter :initialize_presenter_manager

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.save
    respond_to do |format|
      format.html { redirect_to cities_state_path(@city.state_id) }
      format.json { head :no_content }
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_state_path(@city.state_id) }
      format.json { head :no_content }
    end
  end

  private
    def initialize_presenter_manager
      @manager = Manager.new
      @presenter = Presenter.new
    end
    
    def city_params
      params.require(:city).permit(:name, :population, :area, :state_id)
    end
end
