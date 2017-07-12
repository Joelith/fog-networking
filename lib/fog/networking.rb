require "fog/networking/version"
require "fog/networking/services"
require "fog/networking/provider"
require 'logger'

module Fog
  module Networking
  	module OracleCloud
  		autoload :Compute, File.expand_path('../networking/oraclecloud/compute', __FILE__)
  		autoload :Database, File.expand_path('../networking/oraclecloud/database', __FILE__)
  	end
  	module AWS
	  	autoload :Compute, File.expand_path('../networking/aws/compute', __FILE__)
	  end

  end
end
