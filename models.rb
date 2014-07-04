require 'active_record'
require 'crypt_keeper'
require 'faker'
ActiveRecord::Base.establish_connection({:adapter => "sqlite3", :database => 'taxi.db'})

class Passenger < ActiveRecord::Base
  crypt_keeper :password, :encryptor => :aes_new, :key => 'super_good_password', salt: 'salt'
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

