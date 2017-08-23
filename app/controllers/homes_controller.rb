class HomesController < ApplicationController

  def index
    @index_view = true
    # @city = request.location.city
    @city = "Austin"
    # if City.exists?(name: @city)
    #   SongkickHelper.get_city(@city)
    # else
    # end
  end

  def search
    @index_view = false

    if helpers.is_match(params[:user_input])
      page_counter = params[:user_input].slice!(/\d+ months from now/).slice!(/\d{1,2}/).to_i
      user_genre = params[:user_input]
    else
      user_genre = params[:user_input]
      page_counter = params[:page].to_i
    end
    min_date, max_date = PageHelper.get_page(page_counter)
    user_genre = user_genre.chop if user_genre[-1] == " "
    session[:user_search] = user_genre

    helpers.add_genre_to_user(user_genre) if current_user

    if Genre.exists?(genre: user_genre.downcase) # do we want to get rid of this because only searching by genre
      artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
      matched_artists = SpotifyHelper.genre_check(artists_playing, user_genre)
      @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried, "general")
    else # genre entered is not in database
    end

    if request.xhr?
      partials = []
      @matched_events.each do |show|
        partials << render_to_string(partial: "display_show", locals: { show: show })
      end

      if partials.empty?
        partials << render_to_string(partial: "no_matches")
      end

      render :json => { partials: partials }.to_json
    else
      return @matched_events
    end
  end
end
