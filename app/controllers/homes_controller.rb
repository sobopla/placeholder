require 'rspotify'

class HomesController < ApplicationController



  def index
    artists_playing, events_queried = SongkickHelper.get_events

    matched_artists = ["Muse", "Hot Hot Heat", "Nikki Lane", "Deer Tip", "Deer Tick", "Derrick Carter"]
    # artists = ["Forever the Sickest Kids"]

    # return array of artists that fit the genre
    # matched_artists = SpotifyHelper.genre_check(artists_playing)

    # array of events that matches the user's query which we will need to display
    @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried)
  end


end
