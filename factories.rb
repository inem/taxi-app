require 'digest'
require_relative "models"

class PassengerCreator
  def initialize(klass = Passenger)
    @klass = klass
  end

  def create(phone)
    passenger = @klass.find_by_phone(phone)
    unless passenger
      passenger = @klass.create(phone: phone, password: generate_password(phone))
    end

    passenger
  end

  private
  def generate_password(phone)
    Digest::MD5.hexdigest(phone)
  end
end

class DriversGenerator
  def self.generate!(n)
    n.times do
      point = Point.new
      Driver.create(:lat => point.lat,
                    :lon => point.lon,
                    :phone => Faker::PhoneNumber.phone_number,
                    :name => Faker::Name.name)
    end
  end
end