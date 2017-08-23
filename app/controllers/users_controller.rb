class UsersController < ApplicationController

  def show
    binding.pry
    current_user.delete_expired_events
    @upcoming_shows = []
    current_user.all_genres.each do |genre|
      # if current_user.events.where(genre: genre).count < 5 # will there ever be more than 5? # definitely less than 5
        # get more shows

      @upcoming_shows <<{ genre: genre,
                          shows: current_user.events.where(genre: genre)
                        }
    end
    return @upcoming_shows
  end
end

# make sure that events are not past
# limit 5
# what if they are empty?