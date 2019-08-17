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

customer1.save
customer2.save
customer3.save
