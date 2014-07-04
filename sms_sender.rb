class SmsSender
  include Sidekiq::Worker

  def perform(phone)
    puts "Just sent SMS to phone number: #{phone}"
  end
end