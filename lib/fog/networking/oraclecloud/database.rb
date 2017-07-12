require 'pp'

module Fog
	module Networking
		module OracleCloud 
			class Database < Fog::Networking::Provider
				def connect(ip, port)
					Fog::Logger.debug "Connecting #{ip} through port #{port} for #{@instance.service_name}"
					@instance.add_rule(port, ip);
				end
			end
		end
	end
end
