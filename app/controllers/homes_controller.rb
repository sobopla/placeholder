require 'rspotify'

class HomesController < ApplicationController



  def index
    artists = ["Muse", "Hot Hot Heat", "Nikki Lane", "Deer Tip", "Deer Tick"]
    # artists = ["Forever the Sickest Kids"]

    # return array of artists that fit the genre
    matched_artists = SpotifyHelper.genre_check(artists)
  end


end
