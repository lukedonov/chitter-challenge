require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    
    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC")
    result.map { |peep| peep['peep'] + " - " + peep["username"] + " #{peep["time"][0..-10]}"}
  end

  def self.post(username, peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    
    connection.exec("INSERT INTO peeps (username, peep, time) VALUES('#{username}', '#{peep}', '#{Time.now}')")
  end
end