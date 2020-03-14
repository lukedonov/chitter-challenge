require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base 
  
  get '/' do
    "Welcome to Chitter"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end
  
  get '/chitter/new-peep' do
    erb :new
  end
  
  post '/chitter' do
    usn = params['username']
    peep = params['peep']
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    connection.exec("INSERT INTO peeps (username, peep, time) VALUES('#{usn}', '#{peep}', '#{Time.now}')")
    redirect '/chitter'
  end
  
  
run if app_file == $0 
end