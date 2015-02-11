class City < ActiveRecord::Base
  belongs_to :state
  has_one  :wiki_link, as: :linkable

  validates :name, presence: true
  validates :population, numericality: true
  validates :area, numericality: true
  validates :state_id, presence: true

end
