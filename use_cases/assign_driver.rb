require_relative '../models'
require_relative '../sms_sender'

class AssignDriver
  def run!(booking)
    driver = find_nearest_driver(booking.lat, booking.lon)
    assignment = Assignment.create!(:booking_id => booking.id, :driver_id => driver.id)
    SmsSender.perform_async(driver.phone)
    assignment
  end

  private
  #fake implemetation
  def find_nearest_driver(lat, lon)
    offset = rand(Driver.count)
    Driver.first(:offset => offset)
  end
end