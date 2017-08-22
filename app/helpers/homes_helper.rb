module HomesHelper

  def is_match(string)
    !!(string =~ /\d+ months from now/)
  end

  def total_months(string)
    matched_phrase = string.slice!(/\d+ months from now/) # "5 months from now"
    months_later = string.slice!(/\d+ months from now/).slice!(/\d{1,2}/)
    return genre, time
  end

  def add_genre_to_user(genre)
    current_user.genres << Genre.find_by(genre: user_genre) if !current_user.all_genres.include?(user_genre)
  end

end
