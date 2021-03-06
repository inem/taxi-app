require 'sinatra'
require 'sinatra/json'
require 'sidekiq'
require_relative 'models'
require_relative 'use_cases/assign_driver'

get '/booking/:phone' do
  passenger = Passenger.find_by_phone(params[:phone])

  booking = Booking.find_all_by_passenger_id(passenger.id).last
  json booking.id
end

get '/booking/details/:phone' do
  passenger = Passenger.find_by_phone(params[:phone])

  booking = Booking.find_all_by_passenger_id(passenger.id).last
  assignment = Assignment.find_all_by_booking_id(booking.id).last
  driver = Driver.find_by_id(assignment.driver_id)

  json :driver_name => driver.name, :driver_phone => driver.phone
end

get '/assignment/new/:booking_id' do
  booking = Booking.find_by_id(params[:booking_id])
  use_case = AssignDriver.new
  assignment = use_case.run!(booking)
  json assignment.id
end