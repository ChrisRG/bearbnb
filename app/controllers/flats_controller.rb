class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end
end
