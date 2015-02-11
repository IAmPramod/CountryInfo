class Presenter
  include ActionView::Helpers
  attr_reader :path_helper

  def initialize()
    @path_helper = Rails.application.routes.url_helpers
  end

  def format_countries_data(countries_data)
    data_columns = countries_data.map do |country|
      {
        '0' => link_to(country[:name], path_helper.states_country_path(country[:id]), method: :get),
        '1' => country[:population],
        '2' => country[:area],
        '3' => number_with_precision(country[:literacy], :precision => 2),
        '4' => country[:currency],
        '5' => country[:timezone],
        '6' => country[:wikilink],
        '7' => link_to('delete', path_helper.country_path(country[:id]), method: :delete,data: { confirm: 'Are you sure?' })
      }
    end
    return data_columns
  end

  def format_states_data(states_data)
    data_columns = states_data.map do |state|
      {
        '0' => link_to(state[:name], path_helper.cities_state_path(state[:id]), method: :get),
        '1' => state[:population],
        '2' => state[:area],
        '3' => number_with_precision(state[:literacy], :precision => 2),
        '4' => state[:wikilink],
        '5' => link_to('Delete', path_helper.state_path(state[:id]), method: :delete,data: { confirm: 'Are you sure?' })
      }
    end
    return data_columns
  end

  def format_cities_data(cities_data)
    data_columns = cities_data.map do |city|
      {
        '0' => city[:name],
        '1' => city[:population],
        '2' => city[:area],
        '3' => city[:wikilink],
        '4' => link_to('Delete', path_helper.city_path(city[:id]), method: :delete,data: { confirm: 'Are you sure?' } )
      }
    end
    return data_columns
  end

  def display_column_headers(columns)
    header_columns = columns.collect{|column_name| content_tag(:th, column_name)}
    return header_columns.join("").html_safe
  end

  def generate_datatable_json(params, records, record_count)
    json = {}
    json[:draw] = params[:draw] || -1
    json[:recordsTotal] = record_count
    json[:data] = records

    json.to_json
  end
end