require('pry')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/customer')

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

film1 = Film.new({
  'title' => 'In The Loop',
  'price' => 8.00
})

film2 = Film.new({
  'title' => 'War of the Worlds',
  'price' => 4.50
})

film3 = Film.new({
  'title' => 'Spider Man',
  'price' => 10.00
})

ticket1 = Ticket.new({
  'film_id' => 1,
  'customer_id' => 1
})

ticket2 = Ticket.new({
  'film_id' => 2,
  'customer_id' => 1
})

ticket3 = Ticket.new({
  'film_id' => 1,
  'customer_id' => 3
})

ticket4 = Ticket.new({
  'film_id' => 2,
  'customer_id' => 1
})

ticket5 = Ticket.new({
  'film_id' => 3,
  'customer_id' => 2
})


customer1.save
customer2.save
customer3.save
film1.save
film2.save
film3.save
ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
