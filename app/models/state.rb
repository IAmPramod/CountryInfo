class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_one  :wiki_link, as: :linkable

  validates :name, presence: true
  validates :literacy, presence: true, numericality: true
  validates :country_id, presence: true

  def area
    area = 0
    self.cities.each do|city|
      area += city.area
    end
    return area
  end

  def population
    population = 0
    self.cities.each do|city|
      population += city.population
    end
    return population
  end

end
