module SongkickHelper

  # def self.get_events(city, time)
  def self.get_events
    songkick = Songkickr::Remote.new "CdiRCPNwC1rX99q1" # Songkick key

    # pages = songkick.events(min_date: 1.hour.from_now.strftime("%Y-%m-%d"), max_date: 12.hours.from_now.strftime("%Y-%m-%d"),location: "sk:9179", page: 1000)
    pages = songkick.events(min_date: 2.hours.ago.strftime("%Y-%m-%d"), max_date: 12.hours.from_now.strftime("%Y-%m-%d"),location: "sk:9179", page: 1000)
    total_pages = (pages.total_entries / 50) + 1 # tells how many pages of events there are
    i = 1
    artists = []
    events = []
    while i <= total_pages
      response = songkick.events(min_date: 2.hours.ago.strftime("%Y-%m-%d"), max_date: 12.hours.from_now.strftime("%Y-%m-%d"),location: "sk:9179", page: i)
      response.results.each do |result|
        events << result
        result.performances.each do |performance|
          artists << performance.display_name
        end
      end
      i += 1
    end
    unique_artists = artists.uniq
    return unique_artists, events
  end

end


