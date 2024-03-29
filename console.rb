require('pry')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/screening')

Ticket.delete_all
Screening.delete_all
Film.delete_all
Customer.delete_all


customer1 = Customer.new({
  'name' => 'Henry Rollins',
  'funds' => 60.00
  })

customer2 = Customer.new({
  'name' => 'Jenni Salem',
  'funds' => 85.00
  })

customer3 = Customer.new({
  'name' => 'Bert Holly',
  'funds' => 23.34
  })

customer4 = Customer.new({
  'name' => 'No Money Frank',
  'funds' => 0.20
  })

film1 = Film.new({
  'title' => 'In The Loop',
  'year' => 2009
  })

film2 = Film.new({
  'title' => 'War of the Worlds',
  'year' => 2004
  })

film3 = Film.new({
  'title' => 'Spider Man',
  'year' => 2014
  })

customer1.save
customer2.save
customer3.save
film1.save
film2.save
film3.save

screening1 = Screening.new({
  'film_id' => film1.id,
  'film_title' => film1.title,
  'year' => 2009,
  'show_time' => '18:30',
  'price' => 4.00
  })

screening2 = Screening.new({
  'film_id' => film2.id,
  'film_title' => film2.title,
  'year' => 2017,
  'show_time' => '20:00',
  'price' => 8.00
  })

screening3 = Screening.new({
  'film_id' => film3.id,
  'film_title' => film3.title,
  'year' => 2015,
  'show_time' => '23:30',
  'price' => 10.00
  })

screening4 = Screening.new({
  'film_id' => film3.id,
  'film_title' => film3.title,
  'year' => 2015,
  'show_time' => '15:30',
  'price' => 10.00
  })

screening5 = Screening.new({
  'film_id' => film3.id,
  'film_title' => film3.title,
  'year' => 2015,
  'show_time' => '10:30',
  'price' => 10.00
  })

  screening1.save
  screening2.save
  screening3.save
  screening4.save
  screening5.save

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer1.id,
  'screening_id' => screening1.id
  })

ticket2 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer1.id,
  'screening_id' => screening2.id
  })

ticket3 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer3.id,
  'screening_id' => screening1.id
  })

ticket4 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer1.id,
  'screening_id' => screening2.id
  })

ticket5 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer2.id,
  'screening_id' => screening3.id
  })

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save

binding.pry
nil



__END__

Create a screenings table that lets us know what time films are showing
Write a method that finds out what is the most popular time (most tickets sold) for a given film
Limit the available tickets for screenings.
Add any other extensions you think would be great to have at a cinema!
