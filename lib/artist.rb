class Artist
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
 	attr_accessor :name, :page

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


end