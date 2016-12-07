require 'open-uri'
class Scraper

	@@site = 'http://www.deviantart.com/browse/all'

	def self.scrape(url = @@site)
		index = Nokogiri::HTML(open(url))
		
	end
end
=begin

link = index.css(".thumb").attribute("href").value
title = index.css(".thumb .title").text
artist = index.css(".thumb .artist").text

=end