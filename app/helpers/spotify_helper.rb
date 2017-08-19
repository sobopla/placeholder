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
    ENV["ACCESS_TOKEN"] = hash["access_token"]

  end

end


