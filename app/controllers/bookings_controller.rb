class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end


  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = User.last
    @booking.status = 'pending'
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def booking_params
    params[:booking].permit(:start_date, :end_date)
  end
end
