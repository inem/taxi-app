require 'active_record'
require 'crypt_keeper'
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
