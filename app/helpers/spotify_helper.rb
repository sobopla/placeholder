require 'net/http'
require 'json'
# require 'uri'

module SpotifyHelper

  def self.get_token

    encode = (Base64.encode64("98dde3b460bc42a6b3ea332b548b3ea2" + ':' + "3d6c772b442f4454994fa3635122fc14")).gsub("\n",'')
    uri = URI.parse("https://accounts.spotify.com/api/token")
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "Basic #{encode}"
    request.set_form_data(
      "grant_type" => "client_credentials",
    )

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    hash = JSON.parse(response.body)
    return hash["access_token"]
    # ENV["ACCESS_TOKEN"] = hash["access_token"]

  end

  def self.genre_check(artists_array)
    access_token = SpotifyHelper.get_token

    # go through the artists_array, for each do the following
    artists = []
    artists_array.each do |artist|
      # if user inputs band name with space at the end, remove the space
      # artist.slice!(-1,1) if artist[-1] == " "

      found_artist = Artist.find_by(name: artist) # return nil or first item

      if found_artist
        artists << found_artist if found_artist.genres.pluck(:genre).any? { |word| word.include?("indie") }
      else # need to make a Spotify API call to get the Spotify ID
        formatted_artist = artist.gsub(/ /, "+")
        uri = URI.parse("https://api.spotify.com/v1/search?q=#{formatted_artist}&type=artist")
        request = Net::HTTP::Get.new(uri)
        request["Authorization"] = "Bearer #{access_token}"

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        # if artist cannot be found in Spotify database
        next if JSON.parse(response.body)["artists"]["items"].empty?
        id_from_spotify = JSON.parse(response.body)["artists"]["items"][0]["id"]
        genre_array = JSON.parse(response.body)["artists"]["items"][0]["genres"]
        band_photo = JSON.parse(response.body)["artists"]["items"][0]["images"][0]["url"]

        # id_from_spotify = "12Chz98pHFMPJEknJQMWvI"
        # genre_array = ["alternative metal",
        #                "alternative rock",
        #                "garage rock",
        #                "indie rock",
        #                "modern rock",
        #                "permanent wave",
        #                "piano rock",
        #                "post-grunge",
        #                "rock"]

        # add to our database
        new_artist = Artist.create(name: artist, spotify: id_from_spotify, image: band_photo)
          genre_array.each do |specific_genre|
            genre = Genre.find_or_create_by(genre: specific_genre)
            new_artist.genres << genre
          end

        artists << new_artist if new_artist.genres.pluck(:genre).any? { |word| word.include?("indie") }
      end
    end
    return artists
  end


end


