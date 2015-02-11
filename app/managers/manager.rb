class Manager
  
  def prepare_countries_data(countries)
    values = []
    countries.each do |country|
      values << {
                :id => country.id,
                :name => country.name,
                :population => country.population,
                :area => country.area,
                :literacy => country.literacy,
                :currency => country.currency,
                :timezone => country.timezone,
                :wikilink => country.wiki_link
              }
      end
    return values
  end

  def prepare_states_data(states)
    values = []
    states.each do |state|
      values << {
                :id => state.id,
                :name => state.name,
                :population => state.population,
                :area => state.area,
                :literacy => state.literacy,
                :wikilink => state.wiki_link
              }
    end
    return values
  end

  def prepare_cities_data(cities)
    values = []
    cities.each do |city|
      values << {
                :id => city.id,
                :name => city.name,
                :population => city.population,
                :area => city.area,
                :wikilink => city.wiki_link
              }
    end
    return values
  end

  def country_datatable_columns
    ['Name', 'Population', 'Area(sq.kms)', 'Literacy Rate', 'Currency', 'TimeZone', 'WikiLink','Action']
  end

  def state_datatable_columns
    ['Name','Population', 'Area(sq.kms)', 'Literacy Rate', 'WikiLink','Action']
  end

  def city_datatable_columns
    ['Name','Population', 'Area(sq.kms)', 'WikiLink','Action']
  end
end