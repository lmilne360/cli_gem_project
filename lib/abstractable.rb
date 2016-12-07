module Abstractable
	module ClassMethods
		def all
			@@all
		end

		def find_by_name(name)
			self.all.detect{|obj| obj.name == name}
		end
	end
	
	module InstanceMethods
		def save
			self.all << save
		end
	end
	
end