require_relative('../db/sqlrunner')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    sql = "INSERT INTO tickets (film_id, customer_id)
    VALUES ($1, $2) RETURNING id"
    values = [@film_id, @customer_id]
    ticket = SqlRunner.run(sql, values)
    @id = ticket[0]['id'].to_i
  end

end
