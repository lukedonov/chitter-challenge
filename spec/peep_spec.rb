require 'peep'

describe Peep do
  # describe ".create" do 
  #   it "allows a user to create a new peep" do
  #    peep = Peep.create(peep: "hello there", username: "obi_wan", time: "#{Time.new}")
  #    persisted_data = PG.connect(dbname: "chitter_database_test").query("SELECT * FROM peeps;")

  #    expect(peep.username).to eq 'obi_wan'
  #    expect(peep.peep).to eq 'hello there'
  #   end
  # end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_database_test')
  
      connection.exec("INSERT INTO peeps (username, peep, time) VALUES ('obi_wan','Hello there','2020-03-14 15:50:03 +0000');")

      peeps = Peep.all
  
      expect(peeps).to include('Hello there - obi_wan 2020-03-14 15:50')
      
    end
  end
end