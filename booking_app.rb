require 'sinatra'
require 'sinatra/json'

require_relative 'factories'
require_relative 'use_cases/create_booking'

def authenticate!(password)
  passenger = Passenger.find_by_password(password)
  unless passenger
    status 403 and json('Not authorized')
  end
  passenger
end

get '/passenger/new/:phone' do
  creator = PassengerCreator.new
  passenger = creator.create(params[:phone])

  json passenger.id
end

get '/passenger/pwd/:phone' do
  passenger = Passenger.find_by_phone(params[:phone])

  json passenger.password
end

get '/booking/create/:password' do
  passenger = authenticate!(params[:password])

  point = Point.new #pseudo coordinates of passenger

  use_case = CreateBooking.new
  booking = use_case.run!(passenger, point.lat, point.lon)

  json booking.id
end