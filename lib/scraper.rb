require 'open-uri'
class Scraper

	@@site = 'http://www.deviantart.com/browse/all'

	def self.scrape(url = @@site)
		art_pieces = []
		index = Nokogiri::HTML(open(url))
		all = index.css(".thumb") # container of all art pieces
		all.each do |item|
			
			title = item.css(".title").text
			artist = item.css(".artist").text
			link = item["href"]

			art_pieces << {title: title, artist_name: artist, link: link}
		end

		art_pieces
	end
end
=begin

link = index.css(".thumb").attribute("href").value
title = index.css(".thumb .title").text
artist = index.css(".thumb .artist").text

=end