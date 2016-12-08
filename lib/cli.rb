class Cli

@@site = 'http://www.deviantart.com/browse/all' #default site

	def self.start
		puts "Welcome to the art browser! Would you like to view the newest, popular or undiscovered art pieces?"
		choice = gets.strip.downcase
		
		if choice == 'newest'
			@@site == 'http://www.deviantart.com/browse/all/digitalart/?order=5'
		elsif choice == 'popular'
			@@site = 'http://www.deviantart.com/browse/all/digitalart/?order=11'
		elsif choice == 'undiscovered'
			@@site == 'http://www.deviantart.com/browse/all/digitalart/?order=134217728'
		else
		puts "that's not an option, viewing default page"		
		end
		scrape(@@site)
		take_action
		puts "Is that all?(Yes|No)" 
		answer = gets.strip.downcase
		unless answer == "yes"
			take_action
		end

	end	

	def self.take_action
		puts "Where do we go from here?"
		puts "List art pieces | List Artists | Find Art | Find Artist"
		answer = gets.strip.downcase

		case answer
		when 'list art'
			list_art
		when 'list artists'
			list_artists
		when 'find art'
			find_art
		when 'find artist'
			find_artist
		else
			puts "That's not a valid choice"
		end
		
	end

	def self.scrape(site)
		data = Scraper.scrape(site)

		data.each do |art_data|
		artist = Artist.new(art_data)
		art = Art.new(art_data)
		art.artist = artist	
		end
	end



def self.list_art
	Art.all.each.with_index(1) {|art, i| puts "#{i}. #{art.title} by #{art.artist.name}"}
end

def self.list_artists
	Artist.all.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name} Website: #{artist.page}"}
end

def self.find_art
	puts "What is the title of the piece, or it's artist?"
	answer = gets.strip
	if Art.find_by_title(answer)
		art = Art.find_by_title(answer)
		puts " Title: #{art.title} Artist: #{art.artist.name} Link: #{art.link}"
	elsif Art.find_by_artist(answer)
		art =  Art.find_by_artist(answer)
		puts "Title: #{art.title} Artist: #{art.artist.name} Link: #{art.link}"
	else 
		puts "Cannot find an art piece with that title or artist"
	end
		
end

def self.find_artist
		puts "What is the name of the artist?"
		name = gets.strip
	artist = Artist.find(name)
	if artist
		puts "#{artist.name.capitalize} has a total of #{artist.art_pieces}, #{artist.comments} and #{artist.pageviews} on his page"
		puts "#{artist.name.capitalize}'s Website is #{artist.page}"
	else
		puts
		"Cannot find that artist"
	end
end



end