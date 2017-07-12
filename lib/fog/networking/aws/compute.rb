require 'pp'

module Fog
	module Networking
		module AWS
			class Compute < Fog::Networking::Provider
				def get_ip_address 
					@instance.public_ip_address
				end	
			end
		end
	end
end
