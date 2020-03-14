require 'pg'

class Peep
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] + " - " + peep["username"]}
  end

  def self.create(peep:, username:, time:)
    
  end
end