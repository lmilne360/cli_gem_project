class Artist
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
 	attr_accessor :name, :page

 @@all = []

 def initialize(arr)
 	@name = arr[:artist_name]
 	@page = arr[:artist_page]
 	self.save
 end

 def find(name)
 	self.all.detect{ |artist| artist.name == name  }
 end


end