class Artist
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
 	attr_accessor :name, :page
 	attr_reader :art_pieces :comments, :pageviews

 @@all = []

 def initialize(art_data)
 	@name = art_data[:artist_name]
 	@page = art_data[:artist_page]
 	self.save
 end

 def self.all
	@@all
 end

 def find(name)
 	self.all.detect{ |artist| artist.name == name  }
 end

 def scrape_profile(@page)
 	doc = Nokogiri:HTML(open(@page))
 	details = doc.css("span.tight").text.split("\n").map do |i|
 		i.strip
 	end.delete_if(&:empty?)
 end


end