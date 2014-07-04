require 'sinatra'
require 'sinatra/json'
require 'sidekiq'
require_relative 'models'
require_relative 'use_cases/assign_driver'

def authenticate!(phone, pwd)
  p = Passenger.find_by_phone(phone)
  unless p.password == pwd
    status 403 and json('Not authorized')
  end
  p
end

get '/booking/:phone' do
  passenger = authenticate!(params[:phone], params[:pwd])

  booking = Booking.find_all_by_passenger_id(passenger.id).last
  json booking.id
end

get '/booking/details/:phone' do
  passenger = authenticate!(params[:phone], params[:pwd])

  booking = Booking.find_all_by_passenger_id(passenger.id).last
  json booking
end

get '/assignment/new/:booking_id' do
  booking = Booking.find_by_id(params[:booking_id])
  use_case = AssignDriver.new
  assignment = use_case.run!(booking)
  json assignment.id
end