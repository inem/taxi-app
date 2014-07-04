require 'sinatra'

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