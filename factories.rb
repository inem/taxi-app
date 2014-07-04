require_relative "models"
require_relative "sms_sender"

class PassengerCreator
  def initialize(klass = Passenger)
    @klass = klass
  end

  def create(phone)
    passenger = @klass.find_by_phone(phone)
    unless passenger
      passenger = @klass.create(phone: phone, password: generate_password)
    end

    passenger
  end

  private
  def generate_password
    (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end

class AssignDriver
  def initialize(booking)
    @booking = booking
    @driver = find_nearest_driver(booking.lat, booking.lon)
  end

  def commit!
    assignment = Assignment.create!(:booking_id => @booking.id, :driver_id => @driver.id)
    SmsSender.perform_async(@driver.phone)
    assignment
  end

  #fake implemetation
  def find_nearest_driver(lat, lon)
    offset = rand(Driver.count)
    Driver.first(:offset => offset)
  end
end

class DriversGenerator
  def self.generate!(n)
    n.times do
      point = Point.new
      Driver.create(:lat => point.lat, :lon => point.lon, :phone => Faker::PhoneNumber.phone_number)
    end
  end
end