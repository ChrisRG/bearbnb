class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :bear
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates_presence_of :address, :name, :available, :price, :capacity
  validates_numericality_of :capacity, only_integer: true
  validates :capacity, inclusion: 1..10
  validates :price, inclusion: 1..9000
end
