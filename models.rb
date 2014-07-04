require 'active_record'
require 'encrypted_attributes'
ActiveRecord::Base.establish_connection({:adapter => "sqlite3", :database => 'taxi.db'})

class Passenger < ActiveRecord::Base
  encrypts :password, :mode => :sha do |user|
    {:salt => "#{user.phone}-#{Time.now}", :embed_salt => true}
  end
end

class Driver < ActiveRecord::Base
end

class Booking < ActiveRecord::Base
end

class Assignment < ActiveRecord::Base
end
