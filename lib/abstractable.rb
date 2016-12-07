module Abstractable
	module ClassMethods
		def all
			@@all
		end

		def empty
			self.all.clear
		end
	end
	
	module InstanceMethods
		def save
			self.all << self
		end
	end
	
end