require_relative('../db/sqlrunner')

class Screening

  attr_reader :film_id, :film_title, :id, :price
  attr_accessor :show_time, :year

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @film_title = options['film_title']
    @year = options['year']
    @show_time = options['show_time']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO screenings (film_id, film_title, year, show_time, price) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@film_id, @film_title, @year, @show_time, @price]
    screening = SqlRunner.run(sql, values)
    @id = screening[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def tickets_sold
    sql = "SELECT tickets.* FROM tickets
      INNER JOIN screenings
      ON tickets.screening_id = screenings.id
      WHERE screening_id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    tickets_data = SqlRunner.run(sql, values)
    tickets_data.map {|tickets| Ticket.new(tickets)}
  end

  def number_of_tickets_sold
    self.tickets_sold.count
  end

end
