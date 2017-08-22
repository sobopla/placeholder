module EventMatchHelper

  def self.get_matched_events(artists, events, type)
    all_concerts = []
    events.each do |event|
      start = modify_start(event.start)
      link = event.uri
      venue = event.venue.display_name

      event.performances.each do |concert|
        if artists.pluck(:name).any? { |word| word.include?(concert.artist.display_name) }
          artist = Artist.find_by(name: concert.artist.display_name)
          show = {  title: concert.artist.display_name,
                    artist: concert.artist.display_name,
                    time: start,
                    link: link,
                    venue: venue,
                    image: artist.image }
          all_concerts << show
        end
        return all_concerts if type == "user" && all_concerts.length == 5
      end
    end
    return all_concerts
  end

  def self.modify_start(start)
    if start.hour == 0 && start.min == 0
      songkick_time = start.strftime("%Y-%m-%d")
    else
      songkick_time = start.strftime("%Y-%m-%d at %l:%M %p")
    end
    return songkick_time
  end

end

