require 'pg'

class User
  
  def self.create(username:, password:, name:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    result = connection.exec("INSERT INTO users (username, password, name, email) VALUES('#{username}', '#{password}', '#{name}', '#{email}') RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end