require 'pp'

module Fog
	module Networking
		module OracleCloud 
			class Compute < Fog::Networking::Provider
				def prepare
					@secList = nil
					# Check if it has a non-default security list
					secLists = @instance.get_security_lists
					secLists.each do |i| 
						if !i.name.include? '/default/default' then @secList = i end
					end
					if !@secList then
						Fog::Logger.debug "Only has default security list. Add one now"
						@secList = @instance.create_security_list
					end

					# Check if it has a public ip
					if !@instance.get_public_ip_address then
						Fog::Logger.debug "Instance doesn't have a public ip address. Add one now"
						@instance.add_public_ip_address
					end	

				end	

				def connect(ip, port)
					Fog::Logger.debug "Connecting #{ip} through port #{port} for #{@instance.name}"
					@secList.add_rule(port, ip);
				end
			end
		end
	end
end
