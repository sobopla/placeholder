require 'rspotify'

class HomesController < ApplicationController


  def index
    @index_view = true
  end

  def search
    @index_view = false
    if Genre.exists?(genre: params[:user_input].downcase) # if what the user entered is a genre
      genre = params[:user_input].downcase
      artists_playing, events_queried = SongkickHelper.get_events
      matched_artists = SpotifyHelper.genre_check(artists_playing, genre)
      @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried)
    else # artist entered
      @matched_events = []
      binding.pry
    end

    if @matched_events.empty?
      flash[:notice] = "no shows that match your criteria"
    end

    return @matched_events
  end


end
