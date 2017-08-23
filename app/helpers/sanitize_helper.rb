module SanitizeHelper

  def self.sanitize_input(input)
    if is_match(input[:user_input])
      page_counter = input[:user_input].slice!(/\d+ months from now/).slice!(/\d{1,2}/).to_i
      user_genre = input[:user_input]
    else
      page_counter = input[:page].to_i
      user_genre = input[:user_input]
    end
    user_genre = user_genre.chop.downcase if user_genre[-1] == " "
    return user_genre, page_counter
  end

  def self.is_match(string)
    !!(string =~ /\d+ months from now/)
  end

end

