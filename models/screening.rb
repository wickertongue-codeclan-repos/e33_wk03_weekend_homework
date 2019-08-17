require_relative('../db/sqlrunner')

class Screening

  attr_reader

  def initilize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @year = options('year').to_i
    @show_time = options['show_time']
  end
