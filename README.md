Implementation notes
====================
I decided not to take rails for this small task.
There are two sinatra apps + one sidekiq worker
Rake task is simple one-liner

Implementation is naive and doesn't cover lots of edge cases. Authentication is also primitive - you just pass password as plain text.


Setup
=====

```
bundle install
ruby schema.rb
rake generate_drivers

ruby booking_app.rb
ruby assignment_app.rb -p 4568
bundle exec sidekiq -r ./sms_sender.rb
```

Booking app API
===============

create passenger:
   http://localhost:4567/passenger/new/8923749824

get passenger password:
  http://localhost:4567/passenger/pwd/8923749824

create booking:
  http://localhost:4567/booking/create/8e4d782b73dd3a6dfca6e0be74e24559



Assignment app API
==================

get booking id by phone number:
  http://localhost:4568/booking/8923749824

get booking details by phone number:
  http://localhost:4568/booking/details/8923749824

create assignment:
  http://localhost:4568/assignment/new/__booking_id__



