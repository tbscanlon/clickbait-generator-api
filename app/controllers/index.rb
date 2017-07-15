class ClickbaitGenerator < Sinatra::Base
  get '/' do
    erb :index
  end
end
