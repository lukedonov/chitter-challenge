require 'peep'

describe Peep do
  # describe ".create" do 
  #   it "allows a user to create a new peep" do
  #    peep = Peep.create(peep: "hello there", username: "obi_wan", time: "#{Time.new}")
  #    persisted_data = PG.connect(dbname: "chitter_database_test").query("SELECT * FROM peeps WHERE id = #{peep.id};")

  #    expect(peep.id).to eq persisted_data.first['id']
  #    expect(peep.username).to eq 'obi_wan'
  #    expect(peep.peep).to eq 'hello there'
  #   end
  # end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_database_test')
  
      connection.exec("INSERT INTO peeps (username, peep) VALUES ('obi_wan','Hello there');")

      peeps = Peep.all
  
      expect(peeps).to include('Hello there - obi_wan')
      
    end
  end
end