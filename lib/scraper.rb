require 'open-uri'
class Scraper

	@@site = 'http://www.deviantart.com/browse/all'

	def self.scrape(url = @@site)
		index = Nokogiri::HTML(open(url))
		
	end
end