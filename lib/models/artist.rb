class Artist
 	attr_accessor :name, :page, :art_pieces, :comments, :pageviews

 @@all = []

 def initialize(name:, page:)
 	@name = name
 	@page = page
 	scrape_profile(@page)
 	save
 end

 def save
 	self.class.all << self
 end

 def self.all
	@@all
 end

 def self.find(name)
 	self.all.detect{ |artist| artist.name.downcase == name }
 end

 def open_page
 	Launchy.open(@page)
 end

 def scrape_profile(page)
 	doc = Nokogiri::HTML(open(page))
 	details = doc.css("span.tight").text.split("\n").map {|i| i.strip}.delete_if(&:empty?)
 	details.each do |attr|
 		self.art_pieces = attr if attr =~ /deviation/i
 		self.comments = attr if attr =~ /comments/i
 		self.pageviews = attr if attr =~ /pageviews/i
 	end

 end

end
