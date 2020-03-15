require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base 
  
  enable :sessions
  
  get '/' do
    "Welcome to Chitter"
  end

  get '/chitter' do
    @user = session[:username]
    @peeps = Peep.all
    erb :index
  end
  
  get '/chitter/new-peep' do
    erb :new
  end
  
  post '/chitter' do
    Peep.post(params['username'], params['peep'])
    redirect '/chitter'
  end
  
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params['username'], password: params['password'], name: params['name'], email: params['email'])
    session[:username] = user
    redirect '/chitter'
  end
  
run if app_file == $0 
end