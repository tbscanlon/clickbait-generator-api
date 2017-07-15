class ClickbaitGenerator < Sinatra::Base

  get '/api' do
    content_type :json
    listicle.generate.to_json
  end

  get '/api/:number' do
    content_type :json
    listicle.generate(params[:number]).to_json
  end
end
