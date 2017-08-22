class HomesController < ApplicationController


  def index

    # @city = request.location.city
    @city = "Austin"
    # if City.exists?(name: @city)
    # SongkickHelper.get_city(@city)
    # else

    # end

    @index_view = true

  end

  def search

    if helpers.is_match(params[:user_input])

    end

    if Genre.exists?(genre: params[:user_input].downcase) # if what the user entered is a genre
      page_counter = params[:page].to_i
      min_date, max_date = PageHelper.get_page(page_counter)

      genre = params[:user_input].downcase
      artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
      matched_artists = SpotifyHelper.genre_check(artists_playing, genre)
      @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried)
    else # artist entered
      @matched_events = []
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
    @index_view = false
  end
end
