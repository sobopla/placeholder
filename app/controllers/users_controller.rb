class UsersController < ApplicationController
include ActionView::Helpers::DateHelper

  def show
    current_user.delete_expired_events
      @upcoming_shows = []
      current_user.all_genres.each do |genre|
        @upcoming_shows <<{ genre: genre,
                            shows: current_user.events.where(genre: genre)
                          }
      end
      return @upcoming_shows
  end
end


#     current_user.delete_expired_events
#     @upcoming_shows = []
#     matched_events = []
#     current_user.all_genres.each do |genre|
#       events_with_genre = current_user.events.where(genre: genre) # [event1, event2] all with "indie"
#       events_missing = events_with_genre.length # 4
# binding.pry
#       if events_missing < 5
#         missing_events = 5 - events_missing # 1
#         latest_event_day = Date.parse(events_with_genre.sort_by(&:start)[-1].start.to_s)
#         today = Date.parse(Time.now.to_s)
#         day_ago = (latest_event_day - today).to_i
#         min_date, max_date = PageHelper.days_away(day_ago + 1)
#         artists_playing, events_queried = SongkickHelper.get_events(min_date, max_date)
#         matched_artists = SpotifyHelper.genre_check(artists_playing, genre)
#         # can you pass hash as argument?
#         matched_events = EventMatchHelper.get_matched_events(matched_artists, events_queried, {type: "user", number_of_events_needed: missing_events })

#         matched_events.each do |event|
#           binding.pry
#           event = Event.new(event)
#           event.genre = session[:user_search]
#           event.user_id = current_user.id
#           current_user.events << event
#         end

#         binding.pry
#       else
#         @upcoming_shows <<{ genre: genre,
#                             shows: current_user.events.where(genre: genre)
#                           }
#         # @upcoming_shows should be 5 otherwise
#       end
#     end
#     return @upcoming_shows
#   end


# make sure that events are not past
# limit 5
# what if they are empty? make sure to show 5 events
