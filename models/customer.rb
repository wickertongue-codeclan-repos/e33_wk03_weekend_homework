require_relative('../db/sqlrunner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer[0]['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) where id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def tickets
    sql = "SELECT tickets.* FROM tickets
      INNER JOIN customers
      ON customers.id = tickets.customer_id
      WHERE customer_id = $1"
    values = [@id]
    ticket_data = SqlRunner.run(sql, values)
    ticket_data.map { |ticket| Ticket.new(ticket)}
  end

  def total_tickets_purchased
    self.tickets.count
  end

  def films
    sql = "SELECT films.* FROM films
      INNER JOIN tickets
      ON films.id = tickets.film_id
      INNER JOIN customers
      ON tickets.customer_id = customers.id
      WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    film_data.map { |film| Film.new(film)}
  end

  def buys_ticket(film, show_time)
    @funds -= film.price
    new_ticket = Ticket.new({
      'film_id' => film.id,
      'customer_id' => self.id,
      'screening_id' => film.find_specific_screening(show_time)
    })
    new_ticket.save
    self.update
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
