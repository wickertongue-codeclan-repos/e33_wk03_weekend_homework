require_relative('../db/sqlrunner')

class Film

  attr_reader :id
  attr_accessor :title, :price, :year, :show_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
    @year = options['year']
    @show_time = options['show_time']
  end

  def save
    sql = "INSERT INTO films (title, price, year, show_time) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @price, @year, @show_time]
    film = SqlRunner.run(sql, values)
    @id = film[0]['id'].to_i
  end

  def update
    sql = "UPDATE films SET (title, price, year, show_time) = ($1, $2, $3, $4) where id = $3"
    values = [@title, @price, @year, @show_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete
      sql = "DELETE FROM films WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT customers.* FROM customers
      INNER JOIN tickets
      ON customers.id = tickets.customer_id
      INNER JOIN films
      ON tickets.film_id = films.id
      WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    customer_data.map { |customer| Customer.new(customer)}
  end

  def total_attendees
    self.customers.count
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
