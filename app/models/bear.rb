class Bear < ApplicationRecord
  has_one :flat
  has_one_attached :photo

  validates_presence_of :species, :description, :name
end
