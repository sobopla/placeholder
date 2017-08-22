module PageHelper

  def self.get_page(page_counter)
    case page_counter
      when 0
        min_date = 1.hour.from_now.strftime("%Y-%m-%d")
        max_date = 1.month.from_now.strftime("%Y-%m-%d")
      when 1
        min_date = 1.month.from_now.strftime("%Y-%m-%d")
        max_date = 2.months.from_now.strftime("%Y-%m-%d")
      when 2
        min_date = 2.months.from_now.strftime("%Y-%m-%d")
        max_date = 3.months.from_now.strftime("%Y-%m-%d")
      when 3
        min_date = 3.months.from_now.strftime("%Y-%m-%d")
        max_date = 4.months.from_now.strftime("%Y-%m-%d")
      when 4
        min_date = 4.months.from_now.strftime("%Y-%m-%d")
        max_date = 5.months.from_now.strftime("%Y-%m-%d")
      when 5
        min_date = 5.months.from_now.strftime("%Y-%m-%d")
        max_date = 6.months.from_now.strftime("%Y-%m-%d")
    end
    return min_date, max_date
  end
end
