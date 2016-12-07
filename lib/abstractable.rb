module Abstractable
	module ClassMethods
		

		def empty
			self.all.clear
		end
	end
	
	module InstanceMethods
		def save
			self.class.all << self
		end
	end
	
end