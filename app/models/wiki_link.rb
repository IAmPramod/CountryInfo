class WikiLink < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true
end
