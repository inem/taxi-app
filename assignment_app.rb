require 'sinatra'
require 'sinatra/json'
require 'faker'
require_relative 'models'

def authenticate!(phone, pwd)
  p = Passenger.find_by_phone(phone)
  unless p.password == pwd
    status 403 and json('Not authorized')
  end
  p
end

get '/booking/create/:phone' do
  passenger = authenticate!(params[:phone], params[:pwd])
  point = Point.new

  booking = Booking.create(:passenger_id => passenger.id, :lat => point.lat, :lon => point.lon)
  json booking.id
end

get '/booking/:phone' do
  passenger = authenticate!(params[:phone], params[:pwd])

  booking = Booking.find_all_by_passenger_id(passenger.id).last
  json booking.id
end

get '/booking/id/:phone' do
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
  lat, long = params[:lat], params[:long]

end

class Point
  attr_accessor :lat, :lon
  def initialize
    @lat = Faker::Address.latitude
    @lon = Faker::Address.longitude
  end
end