class StatesController < ApplicationController
  before_action :initialize_presenter_manager

  def cities
    @state = State.includes(:cities,:wiki_link).find(params[:id])
    @city = City.new
    @columns_headers = @manager.city_datatable_columns
    respond_to do |format|
      format.html {render :template => '/states/show_cities'}
      format.json do 
        cities_data = @manager.prepare_cities_data(@state.cities)
        cities_data_json = @presenter.format_cities_data(cities_data)
        render :json => @presenter.generate_datatable_json(params, cities_data_json, cities_data.count)
      end
    end
  end

  def create
    @state = State.new(state_params)
    @state.save
    respond_to do |format|
      format.html { redirect_to states_country_path(@state.country_id)}
      format.json { redirect_to states_country}
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_country_path(@state.country_id) }
      format.json { head :no_content }
    end
  end

  private
    def initialize_presenter_manager
      @manager = Manager.new
      @presenter = Presenter.new
    end

    def state_params
      params.require(:state).permit(:name, :literacy, :country_id)
    end
end
