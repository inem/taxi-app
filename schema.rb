require 'sequel'
DB = Sequel.sqlite('taxi.db')

DB.create_table :passengers do
  primary_key :id
  String :phone
  Text :password
  Text :salt
end

DB.create_table :drivers do
  primary_key :id
  String :lat
  String :lon
  String :phone
  String :name
end

DB.create_table :bookings do
  primary_key :id
  String :passenger_id
  String :lat
  String :lon
end

DB.create_table :assignments do
  primary_key :id
  String :booking_id
  String :driver_id
end