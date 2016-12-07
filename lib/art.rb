class Art
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
	attr_accessor :title, :artist, :link
	
	@@all = []

	def initialize(arr)
		@title = arr[:title]
		@artist = arr[:artist]
		@link = arr[:link]
	end

end