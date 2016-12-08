class Cli

@@site = 'http://www.deviantart.com/browse/all' #default site

	def self.start
		puts " Welcome to the art browser, would you like to view the newest, popular, or undiscovered  art pieces?"
		choice = gets.strip

		if choice.downcase == 'newest'
			@@site == 'http://www.deviantart.com/browse/all/digitalart/?order=5'
		elsif choice.downcase == 'popular'
			@@site = 'http://www.deviantart.com/browse/all/digitalart/?order=11'
		elsif choice.downcase == 'undiscovered'
			@@site == 'http://www.deviantart.com/browse/all/digitalart/?order=134217728'
		else
		puts "that's not an option, viewing default page"		
		end

	end


		@data = Scraper.scrape(@@site)	



@data.each do |art_data|
	artist = Artist.new(art_data)
	art = Art.new(art_data)
	art.artist = artist	
end


def self.list_art
	Art.all.each.with_index(1) {|art, i| puts "#{i}. #{art.title} by #{art.artist.name}"}
end

def self.list_artists
	Artist.all.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name} Page: #{artist.page}"}
end

end