class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :bear
  has_many :bookings
  has_one_attached :photo
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: :will_save_change_to_address?

  validates_presence_of :address, :name, :available, :price, :capacity
  validates_numericality_of :capacity, only_integer: true
  validates :capacity, inclusion: 1..10
  validates :price, inclusion: 1..9000

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
