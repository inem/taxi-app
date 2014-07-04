require_relative '../models'
require_relative '../assignment_api'

class CreateBooking
  def run!(passenger, lat, lon)
    booking = Booking.create(:passenger_id => passenger.id, :lat => lat, :lon => lon)
    assignment_callback(booking.id)
  end

  private
  def assignment_callback(booking_id)
    AssignmentApi.call(booking_id)
  end
end