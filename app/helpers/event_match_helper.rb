module EventMatchHelper

  def self.get_matched_events(artists, events)
    all_concerts = []
    events.each do |event|
      show_name = event.display_name
      start = event.start
      link = event.uri
      venue = event.venue.display_name

      event.performances.each do |concert|
        if artists.include?(concert.display_name)
          show = { title: show_name,
                    time: start.strftime("%l %M %p"),
                    link: link,
                    venue: venue }
          all_concerts << show
        end
      end
    end
    return all_concerts
  end


end


