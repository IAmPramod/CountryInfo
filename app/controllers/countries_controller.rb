class CountriesController < ApplicationController
  before_filter :initialize_presenter_manager

  def index
    @countries = Country.all
    @country = Country.new
    @columns_headers = @manager.country_datatable_columns

    respond_to do |format|
      format.html
      format.json do
        countries_data = @manager.prepare_countries_data(@countries)
        countries_data_json = @presenter.format_countries_data(countries_data)
        render :json => @presenter.generate_datatable_json(params, countries_data_json, countries_data.count)
      end
    end
  end

  def states
    @state = State.new
    @country = Country.includes(states: [:cities]).find(params[:id])
    states = State.where(country_id: @country.id)
    @columns_headers = @manager.state_datatable_columns
    
    respond_to do |format|
      format.html {render :template => '/countries/show_states'}
      format.json do 
        states_data = @manager.prepare_states_data(states)
        states_data_json = @presenter.format_states_data(states_data)
        render :json => @presenter.generate_datatable_json(params, states_data_json, states_data.count)
      end
    end
  end

  def create
    @country = Country.new(country_params)
    @country.save
    respond_to do |format|
      format.html { redirect_to :action => "index"}
      format.json { redirect_to :action => "index"}
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def initialize_presenter_manager
      @manager = Manager.new
      @presenter = Presenter.new
    end

    def country_params
      params.require(:country).permit(:name, :currency, :timezone)
    end
end