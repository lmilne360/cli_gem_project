class Cli

Scraper.scrape.each do |art_data|
	artist =Artist.new(art_data)
	art = Art.new(art_data)
	art.artist = artist	
end


end