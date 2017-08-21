module EventMatchHelper

  def self.get_matched_events(artists, events)
    all_concerts = []
    events.each do |event|
      show_name = event.display_name
      start = event.start
      link = event.uri
      venue = event.venue.display_name
      event.performances.each do |concert|
        if artists.pluck(:name).any? { |word| word.include?(concert.artist.display_name) }
          artist = Artist.find_by(name: concert.artist.display_name)
          show = { title: show_name,
                    time: start.strftime("%l:%M %p"),
                    link: link,
                    venue: venue,
                    image: artist.image }
          all_concerts << show
        end
      end
    end
    return all_concerts
  end


end


