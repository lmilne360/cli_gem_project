class Artist
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
 	attr_accessor :name, :page
 	
 @@all = []

 def initialize(arr)
 	@name = arr[:artist_name]
 	@page = arr[:artist_page]
 end


end