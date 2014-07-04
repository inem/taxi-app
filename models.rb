require 'active_record'
require 'faker'
ActiveRecord::Base.establish_connection({:adapter => "sqlite3", :database => 'taxi.db'})

class Passenger < ActiveRecord::Base
end

class Driver < ActiveRecord::Base
end

class Booking < ActiveRecord::Base
end

class Assignment < ActiveRecord::Base
end

class Point
  attr_accessor :lat, :lon
  def initialize
    @lat = Faker::Address.latitude
    @lon = Faker::Address.longitude
  end
end

