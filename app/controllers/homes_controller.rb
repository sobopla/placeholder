require 'rspotify'

class HomesController < ApplicationController



  def index
    SpotifyHelper.get_token
  end


end
