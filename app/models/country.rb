class Country < ActiveRecord::Base
  has_many :states, dependent: :destroy
  has_one  :wiki_link, as: :linkable

  validates :name, presence: true
  validates :currency, presence: true
  validates :timezone, presence: true

  def area
    area = 0
    self.states.each do|state|
      area += state.area
    end
    return area
  end

  def literacy
    sum = 0
    self.states.each do|state|
      sum += state.literacy
    end
    if self.states.count == 0
      return sum
    else
      return (sum/self.states.count)
    end
  end

  def population
    population = 0
    self.states.each do|state|
      population += state.population
    end
    return population
  end
end
