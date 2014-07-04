require 'sinatra'
require 'sinatra/json'
require_relative 'models'

def authenticate!(phone, pwd)
  p = Passenger.find_by_phone(phone)
  unless p.password == pwd
    status 403 && json 'Not authorized'
  end
  p
end

post '/booking/create/:phone' do

end

get '/booking/:phone' do

end

get '/booking/id/:phone' do

end

get '/booking/details/:phone' do

end

get '/assignment/new/:booking_id' do
  lat, long = params[:lat], params[:long]

end