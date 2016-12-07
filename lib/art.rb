class Art
	extend Abstractable::ClassMethods
	include Abstractable::InstanceMethods
	attr_accessor :title, :artist, :link

	@@all = []

	def initialize(art_data)
		@title = art_data[:title]
		@link = art_data[:link]
		self.save
	end

	def self.all
		@@all
	end

	def find_by_title(title)
		self.all.detect{|art| art.title = title}
	end

	def find_by_artist(artist_name)
		self.all.detect{|art| art.artist.name = artist_name}
	end


end