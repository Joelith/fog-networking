# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/networking/version'

Gem::Specification.new do |spec|
  spec.name          = "fog-networking"
  spec.version       = Fog::Networking::VERSION
  spec.authors       = ["Joel Nation"]
  spec.email         = ["joel.nation@outlook.com"]

  spec.summary       = "Gem to auto-configure networking between different cloud providers using the Fog Library"
  spec.description   = "Gem to auto-configure networking between different cloud providers using the Fog Library"
  spec.homepage      = "http://github.com/Joelith/fog-networking"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency 'fog-aws'
  spec.add_development_dependency 'fog-oraclecloud'


end
