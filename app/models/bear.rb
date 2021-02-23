class Bear < ApplicationRecord
  SPECIES = ["brown", "grizzly", "polar", "panda"]
  has_one :flat

  validates_presence_of :species, :description, :name
  validates :species, inclusion: { in: SPECIES }
end
