require 'typhoeus'

class AssignmentApi
  def self.call(booking_id)
    Typhoeus.get("http://localhost:4568/assignment/new/#{booking_id}", followlocation: true)
  end
end