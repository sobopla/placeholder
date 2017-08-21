module SongkickHelper

  # def self.get_events(city, time)
  def self.get_events
    songkick = Songkickr::Remote.new "CdiRCPNwC1rX99q1" # Songkick key

    pages = songkick.events(min_date: 1.hour.from_now.strftime("%Y-%m-%d"), max_date: 5.days.from_now.strftime("%Y-%m-%d"),location: "sk:9179", page: 1000)
    total_pages = (pages.total_entries / 50) + 1 # tells how many pages of events there are
    i = 1
    artists = []
    events = []
    while i <= total_pages
      response = songkick.events(min_date: 1.hour.from_now.strftime("%Y-%m-%d"), max_date: 5.days.from_now.strftime("%Y-%m-%d"),location: "sk:9179", page: i)
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

  def self.get_city(user_city)
    uri = URI.parse("http://api.songkick.com/api/3.0/search/locations.json?query=#{user_city}&apikey=CdiRCPNwC1rX99q1")
        request = Net::HTTP::Get.new(uri)

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

    parsed_response = JSON.parse(response.body)

    parsed_response["resultsPage"]["results"]["location"].each do |city|
      City.create(songkick: city["metroArea"]["id"], name: city["metroArea"]["displayName"])
    end


  end
end


