class UsersController < ApplicationController
  def show
    i = 0
    @upcoming_shows = []
    current_user.all_genres.each do |genre|
      @matched_events = []
      while @matched_events.length < 5
        min_date, max_date = PageHelper.days_away(i)
        artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
        matched_artists = SpotifyHelper.genre_check(artists_playing, genre)
        @matched_events << EventMatchHelper.get_matched_events(matched_artists, events_queried, "user")
        @matched_events = @matched_events.flatten.uniq

        i += 1
        @upcoming_shows << { genre: genre, shows: @matched_events } if @matched_events.length >= 5
      end
    end

    # DO NOT DELETE, JOANNA NEEDS TO KEEP IN HER BRAIN
    # @user = User.find(current_user.id)
    # make the query small by limiting how many days out
    # min_date, max_date = PageHelper.days_away(0)
    # # return less artists and events
    # artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
    # @upcoming_shows = []
    # @matched_events = []
    # i = 0

    # while @matched_events.length < (5 * current_user.all_genres.length)
    #   min_date, max_date = PageHelper.days_away(i)
    #   artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
    #   binding.pry
    #   @user.all_genres.each do |genre|
    #     matched_artists = SpotifyHelper.genre_check(artists_playing, genre)
    #     binding.pry
    #     @matched_events << EventMatchHelper.get_matched_events(matched_artists, events_queried, "user")
    #     @upcoming_shows << { genre: genre, shows: @matched_events } if @matched_events.length == 5
    #     binding.pry
    #   end
    #   i += 1
    # end

    # @upcoming_shows

  end
end
