class Cli

data = Scraper.scrape

data.each do |art_data|
	artist = Artist.new(art_data)
	art = Art.new(art_data)
	art.artist = artist	
	binding.pry
end

def self.start
	puts "Welcome! What Would you like to do?"

end


def list_art
	Art.all.each.with_index(1) {|art, i| puts "#{i}. #{art.name} by #{art.artist.name}"}
	
end


end