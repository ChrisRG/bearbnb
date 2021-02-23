class Bear < ApplicationRecord
  has_one :flat

  validates_presence_of :species, :description, :name
end
