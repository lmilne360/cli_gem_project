class Art
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
	attr_accessor :title, :artist, :link

	@@all = []

	def initialize(arr)
		@title = arr[:title]
		@link = arr[:link]
		self.save
	end

	def find_by_title(title)
		self.all.detect{|art| art.title = title}
	end

	def find_by_artist(artist_name)
		self.all.detect{|art| art.artist.name = artist_name}
	end

end