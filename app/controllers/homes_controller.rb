require 'rspotify'

class HomesController < ActionController::Base

  RSpotify.authenticate(ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'])


  def index

    artic_monkeys = RSpotify::Artist.search('Arctic Monkeys')
    @genres = artic_monkeys.genres
  end
end
