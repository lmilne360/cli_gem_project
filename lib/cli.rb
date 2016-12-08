class Cli

@site = 'http://www.deviantart.com/browse/all' #default site

	def self.start
		puts "Welcome to the art browser! Would you like to view the newest, popular or undiscovered art pieces?"
		choice = gets.strip.downcase
		
		if choice == 'newest'
			@site == 'http://www.deviantart.com/browse/all/digitalart/?order=5'
		elsif choice == 'popular'
			@site = 'http://www.deviantart.com/browse/all/digitalart/?order=11'
		elsif choice == 'undiscovered'
			@site == 'http://www.deviantart.com/browse/all/digitalart/?order=134217728'
		else
		puts "that's not an option, viewing default page"		
		end
		puts "Loading art pieces, patience is a virtue ..."
		scrape(@site)
		take_action
		repeat
		
	end	

	def self.repeat
		puts "Is that all?(Yes|No)" 
		answer = gets.strip.downcase
		while answer != "yes"
			take_action
		end
	end

	def self.take_action
		puts "Where do we go from here?"
		puts "List Art Pieces | List Artists | Find Art | Find Artist | End"
		answer = gets.strip.downcase

		case answer
		when 'list art pieces'
			list_art
		when 'list artists'
			list_artists
		when 'find art'
			find_art
		when 'find artist'
			find_artist
		when 'end'
			exit!
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
	art = Art.find_by_title(answer)
	art ||= Art.find_by_artist(answer)
	if art
		puts " Title: #{art.title} Artist: #{art.artist.name} Link: #{art.link}"
		puts "Would you like to visit the link for this piece?"
		ans = gets.strip.downcase
		art.open_link if ans == 'yes'
	else 
		puts "Cannot find an art piece with that title or artist"
	end
		
end

def self.find_artist
		puts "What is the name of the artist?"
		name = gets.strip
		artist = Artist.find(name)
	if artist
		puts "#{artist.name.capitalize} has a total of :\n #{artist.art_pieces}(Art Pieces)\n #{artist.comments}\n #{artist.pageviews}\n On their page."
		puts "#{artist.name.capitalize}'s Website is #{artist.page}"
		puts "Would you like to visit this artist's page?"
		answer = gets.strip.downcase
		artist.open_page if answer == 'yes'
	else
		puts "Cannot find that artist"	
	end
end



end