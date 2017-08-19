require 'rspotify'

class HomesController < ApplicationController

  # RSpotify.authenticate(ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'])
    ARTISTS = ["Muse", "Hot Hot Heat", "Forever the Sickest Kids", "Natalie Portman's Shaved Head", "asdfasdf"]

  def index
    artists = ["Muse", "Hot Hot Heat", "Forever the Sickest Kids", "Natalie Portman's Shaved Head", "asdfasdf"]
    # artic_monkeys = RSpotify::Artist.search('Arctic Monkeys')
    # @genres = artic_monkeys.genres
  end

  def wiki
    # lots of logic to parse WIKI
    ARTISTS.each do |band|

    end
  end
end
