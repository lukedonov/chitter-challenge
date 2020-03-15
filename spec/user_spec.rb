require 'user'

describe User do
  it 'creates a new user' do
    user = User.create(username: "obi_wan", password: "password123")

    connection = PG.connect(dbname: 'chitter_database_test')
    persisted_data = connection.query("SELECT * FROM users WHERE id = '#{user.id}';")

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq 'obi_wan'
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'obi_wan', password: 'password123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end
  end
end