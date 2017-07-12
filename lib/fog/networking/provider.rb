module Fog
	module Networking
		class Provider
			def initialize (instance)
				@instance = instance
			end

			def prepare
				# Assume nothing to do
			end
		end
	end
end