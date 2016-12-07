require 'open-uri'
class Scraper

	@@site = 'http://www.deviantart.com/browse/all'

	def self.scrape(url = @@site)
		art_pieces = []
		index = Nokogiri::HTML(open(url))
		all = index.css(".thumb") # container of all art pieces
		all.each do |item|
			
			title = item.css(".title").text
			artist_name = item.css(".artist").text
			link = item["href"]
			artist_page = item.css(".artist a").attribute("href").value

			art_pieces << {title: title, link:link, artist_name: artist_name, artist_page: artist_page}
		end

		art_pieces
	end
end
=begin

link = index.css(".thumb").attribute("href").value
title = index.css(".thumb .title").text
artist = index.css(".thumb .artist").text

=end