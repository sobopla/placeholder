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
    user_genre, page_counter = SanitizeHelper.sanitize_input({user_input: params[:user_input], page: params[:page]})
    session[:user_search] = user_genre
    min_date, max_date = PageHelper.get_page(page_counter)

    # do we want to get rid of this because only searching by genre
    if Genre.exists?(genre: user_genre)
      artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
      matched_artists = SpotifyHelper.genre_check(artists_playing, user_genre)
      @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried)
    else # genre entered is not in database
    end

    if current_user
      helpers.add_genre_to_user(user_genre)
      helpers.add_to_user_events(@matched_events.first(helpers.minus_five_events(user_genre)), user_genre)
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
