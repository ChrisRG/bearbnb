class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :bear

  validates_presence_of :address, :name, :availability, :price, :capacity
  validates_numeracality_of :capacity, only_integer: true
  validates :capacity, inclusion: 1..10
  validates :price, inclusion: 1..9000
end
