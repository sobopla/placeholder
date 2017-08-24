module HomesHelper

  def total_months(string)
    matched_phrase = string.slice!(/\d+ months from now/) # "5 months from now"
    months_later = string.slice!(/\d+ months from now/).slice!(/\d{1,2}/)
    return genre, time
  end

  def add_genre_to_user(genre)
    current_user.genres << Genre.find_by(genre: genre) if !current_user.all_genres.include?(genre)
  end

  def add_to_user_events(events, genre)
    events.each do |event|
      return if current_user.events.where(genre: genre).length >= 4
      event = Event.new(event)
      event.genre = genre
      event.user_id = current_user.id
      current_user.events << event if event.save
    end
  end

  def minus_four_events(genre)
    current_user.delete_expired_events(genre)
    missing = 4 - current_user.events.where(genre: genre).count
    return missing
  end



end
