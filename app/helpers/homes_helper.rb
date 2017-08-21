module HomesHelper

  def is_match(string)
    !!(string =~ /\d+ months from now/)
  end

end
