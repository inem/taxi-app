require 'sequel'
DB = Sequel.sqlite('taxi.db')

DB.create_table :passengers do
  primary_key :id
  String :phone
  String :password
  String :salt
end

DB.create_table :drivers do
  primary_key :id
  String :lat
  String :long
end

DB.create_table :bookings do
  primary_key :id
  String :passenger_phone
  String :lat
  String :long
end

DB.create_table :assignments do
  primary_key :id
  String :booking_id
  String :driver_id
end