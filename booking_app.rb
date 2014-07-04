require 'sinatra'
require 'sinatra/json'

require_relative 'passenger_creator'

get '/passenger/new/:phone' do
  creator = PassengerCreator.new
  passenger = creator.create(params[:phone])

  json passenger.id
end

get '/pwd/:phone' do

end