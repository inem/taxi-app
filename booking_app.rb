require 'sinatra'
require 'sinatra/json'

require_relative 'factories'

get '/passenger/new/:phone' do
  creator = PassengerCreator.new
  passenger = creator.create(params[:phone])

  json passenger.id
end

get '/passenger/pwd/:phone' do
  passenger = Passenger.find_by_phone(params[:phone])

  json passenger.password
end