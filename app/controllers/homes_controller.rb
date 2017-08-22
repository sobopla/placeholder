class HomesController < ApplicationController


  def index
    # @city = request.location.city
    @city = "Austin"
    # if City.exists?(name: @city)
    #   SongkickHelper.get_city(@city)
    # else
    # end
    @index_view = true

  end

  def search
    if helpers.is_match(params[:user_input])
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
    if current_user
      current_user.genres << Genre.find_by(genre: user_genre) if !current_user.all_genres.include?(user_genre) # if the genre is not already included in the user's searches
    end

    if Genre.exists?(genre: user_genre.downcase) # if user input a genre >> can also take off and assume all entries will be via genre
      page_counter = params[:page].to_i
      artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
      matched_artists = SpotifyHelper.genre_check(artists_playing, user_genre)
      @matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried, "general")
    else # genre entered is not in database
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
