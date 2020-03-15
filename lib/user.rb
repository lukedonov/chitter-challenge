require 'pg'

class User
  
  def self.find(id)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    result = connection.exec("SELECT * FROM users WHERE id = #{ id }")
    User.new(id: result[0]['id'],username: result[0]['username'])
  end

  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    result = connection.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}') RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end