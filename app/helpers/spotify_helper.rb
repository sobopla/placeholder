require 'net/http'
require 'json'

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
    ENV["ACCESS_TOKEN"] = hash["access_token"]
    return hash["access_token"]

  end

  def self.api_call(artist)
    formatted_artist = artist.gsub(/ /, "+")
    uri = URI.parse("https://api.spotify.com/v1/search?q=#{formatted_artist}&type=artist")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{ENV["ACCESS_TOKEN"]}"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    return response
  end

  def self.genre_check(artists_array, user_genre)
    artists = []
    access_token = SpotifyHelper.get_token

    artists_array.each do |artist|
      found_artist = Artist.find_by(name: artist) # return nil or first item
      if found_artist
        artists << found_artist if found_artist.has_genre?(user_genre)
      else # need to make a Spotify API call to get the Spotify ID
        new_artist = Artist.new(name: artist)
        next if new_artist.has_weird_characters # skip if artist has funky characters
        spotify_artist_info = JSON.parse(api_call(new_artist.name).body)["artists"]["items"] # something might be broken here?
        next if spotify_artist_info.empty? # skip artists with no information
        update_new_artist(new_artist, spotify_artist_info)
        artists << new_artist if new_artist.has_genre?(user_genre)
      end
    end
    return artists
  end

  def self.update_new_artist(new_artist, spotify_artist_info)
    new_artist.image = spotify_artist_info[0]["images"][0]["url"] if !spotify_artist_info[0]["images"].empty? # skip if bands do not have image (from Spotify)
    new_artist.spotify = spotify_artist_info[0]["id"]
    genre_array = spotify_artist_info[0]["genres"]

    genre_array.each do |specific_genre|
      genre = Genre.find_or_create_by(genre: specific_genre)
      new_artist.genres << genre
    end
    new_artist.save
  end






end


