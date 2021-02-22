class Booking < ApplicationRecord
  STATUS = ["pending", "accepted", "rejected"]
  belongs_to :user
  belongs_to :flat

  validates_presence_of :start_date, :end_date, :status
  validates :status, inclusion: { in: STATUS }
end
