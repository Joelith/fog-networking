module Fog
	module Networking
		class Services

			def self.connect_instances(instance_from, instance_to, port)
				if instance_from == nil || instance_to == nil then
					raise ArgumentError.new('Need to a Fog instance of both from and to');
				end

				# Not sure if this is the best approach. I had considered extending the actual
				# fog libraries and adding the extra functions we need, but then I'd have to
				# include all the fog modules as dependencies to this one, regardless if the 
				# end user wanted to use them all or not. Simple approach seemed to be to 
				# just record which objects map to which classes in here. 

				registry = YAML.load_file( File.expand_path('registry.yaml'))
				if !registry[instance_to.class.to_s] then
					raise ArgumentError.new("Fog::Networking does not currently support #{instance_to.class.to_s}")
				end
				if !registry[instance_from.class.to_s] then
					raise ArgumentError.new("Fog::Networking does not currently support #{instance_from.class.to_s}")
				end

				service_to = Object.const_get(registry[instance_to.class.to_s]).new(instance_to)
				service_to.prepare
				service_from = Object.const_get(registry[instance_from.class.to_s]).new(instance_from)
				service_from.prepare

				# connect the two instances
				service_to.connect(service_from.get_ip_address, port)
			end	
		end
	end
end
