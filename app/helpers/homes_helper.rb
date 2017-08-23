module HomesHelper

  def total_months(string)
    matched_phrase = string.slice!(/\d+ months from now/) # "5 months from now"
    months_later = string.slice!(/\d+ months from now/).slice!(/\d{1,2}/)
    return genre, time
  end

  def add_genre_to_user(genre)
    current_user.genres << Genre.find_by(genre: genre) if !current_user.all_genres.include?(genre)
  end

  def add_to_user_events(events)
    events.each do |event|
      return if current_user.events.length >= 3
      event = Event.new(event)
      event.genre = session[:user_search]
      event.user_id = current_user.id
      current_user.events << event if event.save
    end
  end

  def minus_five_events
    current_user.delete_expired_events
    missing = 5 - current_user.events.where(genre: session[:user_search]).count
    return missing
  end



end
