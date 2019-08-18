require_relative('../db/sqlrunner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
  end

  def save
    sql = "INSERT INTO films (title) VALUES ($1) RETURNING id"
    values = [@title]
    film = SqlRunner.run(sql, values)
    @id = film[0]['id'].to_i
  end

  def update
    sql = "UPDATE films SET (title) = ($1) where id = $2"
    values = [@title]
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
    customer_data.map {|customer| Customer.new(customer)}
  end

  def screenings
    sql = "SELECT screenings.* FROM screenings
      INNER JOIN films
      ON screenings.film_id = films.id
      WHERE film_id = $1"
    values = [@id]
    screening_data = SqlRunner.run(sql, values)
    screening_data.map {|screening| Screening.new(screening)}
  end

  def find_specific_screening(show_time)
    sql = "SELECT screenings.* FROM screenings
      INNER JOIN films
      ON screenings.film_id = films.id
      WHERE screenings.show_time = $1"
    values = [show_time]
    screening_data = SqlRunner.run(sql, values)
    screening_data.map {|screening| Screening.new(screening)}
  end

  def total_attendees
    self.customers.count
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def tickets_sold
    sql = "SELECT tickets.* FROM tickets
      INNER JOIN films
      ON tickets.film_id = films.id
      WHERE films.id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    tickets_data = SqlRunner.run(sql, values)
    tickets_data.map {|tickets| Ticket.new(tickets)}
  end

end



__END__

def find_specific_screening_return_id(show_time)
  sql = "SELECT screenings.id FROM screenings
    INNER JOIN films
    ON screenings.film_id = films.id
    WHERE screenings.show_time = $1"
  values = [show_time]
  screening_data = SqlRunner.run(sql, values)
  screening_data.map {|screening| Screening.new(screening)}
end
