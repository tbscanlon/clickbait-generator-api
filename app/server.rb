class ClickbaitGenerator < Sinatra::Base
  register Sinatra::Partial
  set :partial_template_engine, :erb

  helpers do
    def listicle
      Listicle.create
    end
  end
end
