class Artist
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
 	attr_accessor :name, :page, :art_pieces, :comments, :pageviews

 @@all = []

 def initialize(art_data)
 	@name = art_data[:artist_name]
 	@page = art_data[:artist_page]
 	scrape_profile(@page)
 	self.save
 end

 def self.all
	@@all
 end

 def find(name)
 	self.all.detect{ |artist| artist.name.downcase == name.downcase  }
 end

 def scrape_profile(page)
 	doc = Nokogiri::HTML(open(page))
 	details = doc.css("span.tight").text.split("\n").map do |i| #details is an array containing [1] amount art pieces [2]  total comments [3] total pageviews 
 		i.strip
 	end.delete_if(&:empty?)

 	self.art_pieces = details[1]
 	self.comments = details[2]
 	self.pageviews = details[3]
 end


end

