class UsersController < ApplicationController
include ActionView::Helpers::DateHelper

  def show
    @upcoming_shows = []
    current_user.all_genres.each do |genre|
      current_user.delete_expired_events(genre)
      @upcoming_shows <<{ genre: genre,
                          shows: current_user.events.where(genre: genre)
                        }
    end
    return @upcoming_shows
  end
end
