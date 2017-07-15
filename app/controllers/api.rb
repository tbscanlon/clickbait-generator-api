class ClickbaitGenerator < Sinatra::Base
  get '/api' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    listicle.generate.to_json
  end

  get '/api/:number' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    listicle.generate(params[:number]).to_json
  end
end
