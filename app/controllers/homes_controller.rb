class HomesController < ApplicationController


  def index

    @index_view = true
    @city = "Austin"

    # @city = request.location.city
    # if City.exists?(name: @city)
    # SongkickHelper.get_city(@city)
    # else
    # end
  end

  def search
    @index_view = false
    if helpers.is_match(params[:user_input]) # if user adds "months from now"
      matched_phrase = params[:user_input].slice!(/\d+ months from now/) # "5 months from now"
      months_later = matched_phrase[0].to_i # 5 # this will have an error if it is 00 months
      user_genre = params[:user_input] # indie
      min_date, max_date = PageHelper.get_page(months_later)
    else
      user_genre = params[:user_input]
      page_counter = params[:page].to_i
      min_date, max_date = PageHelper.get_page(page_counter)
    end

    user_genre = user_genre.chop if user_genre[-1] == " "
    session[:user_search] = user_genre # "indie"

    if Genre.exists?(genre: user_genre.downcase) # if what the user entered is a genre
      # page_counter = params[:page].to_i
      artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
      matched_artists = SpotifyHelper.genre_check(artists_playing, user_genre)
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

  end
end #end
