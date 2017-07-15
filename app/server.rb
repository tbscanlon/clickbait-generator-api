class ClickbaitGenerator < Sinatra::Base
  helpers do
    def listicle
      Listicle.create
    end
  end

  get '/' do
    listicle.generate
  end
end
