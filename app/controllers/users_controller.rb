class UsersController < ApplicationController

  def show
    @upcoming_shows = []
    current_user.all_genres.each do |genre|
      @upcoming_shows <<{ genre: genre,
                          shows: User.first.events.where(genre: genre)
                        }
    end
    return @upcoming_shows
  end
end

# make sure that events are not past
# limit 5