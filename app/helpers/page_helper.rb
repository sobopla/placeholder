module PageHelper

  def self.get_page(page_counter)
    if page_counter == 0 || page_counter.nil?
      min_date = 1.hour.from_now.strftime("%Y-%m-%d")
      max_date = 2.hours.from_now.strftime("%Y-%m-%d")
    else
      min_date = page_counter.weeks.from_now.strftime("%Y-%m-%d")
      max_date = (page_counter + 1).weeks.from_now.strftime("%Y-%m-%d")
    end
    return min_date, max_date
  end

  def self.days_away(number)
    if number == 0
      min_date = 1.hour.from_now.strftime("%Y-%m-%d")
      max_date = 1.day.from_now.strftime("%Y-%m-%d")
    else
      min_date = number.days.from_now.strftime("%Y-%m-%d")
      max_date = (number + 1).days.from_now.strftime("%Y-%m-%d")
    end
    return min_date, max_date
  end
end
