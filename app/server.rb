class ClickbaitGenerator < Sinatra::Base
  helpers do
    def listicle
      Listicle.create
    end
  end
end
