require_relative "models"

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
    @driver = find_nearest_driver
  end

  def commit!
    Assignment.create!(:booking_id => @booking.id, :driver_id => @driver.id)
  end

  def find_nearest_driver(lat, lon)
    Driver.last #fake implemetation
  end
end

class DriversGenerator
  def self.generate!(n)
    n.times do
      point = Point.new
      Driver.create(:lat => point.lat, :lon => point.lon)
    end
  end
end