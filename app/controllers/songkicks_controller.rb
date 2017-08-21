# require 'songkickr'

# class SongkicksController < ApplicationController
#   def index
#     songkick = Songkickr::Remote.new "CdiRCPNwC1rX99q1"

#     pages = songkick.events(min_date: 1.hour.from_now.strftime("%Y-%m-%d"), max_date: 2.days.from_now.strftime("%Y-%m-%d"),location: "sk:9426", page: 1000)
#     total_pages = (pages.total_entries / 50) + 1

#     i = 1
#     artists = []
#     while i <= total_pages
#       response = songkick.events(min_date: 1.hour.from_now.strftime("%Y-%m-%d"), max_date: 2.days.from_now.strftime("%Y-%m-%d"),location: "sk:9426", page: i)
#       response.results.each do |result|
#         result.performances.each do |performance|
#           artists << performance.display_name
#         end
#       end
#       i += 1
#     end
#     artists.uniq!
#     p response

#     # spotify
#   end
# end
