# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_connect/decoder/version'

Gem::Specification.new do |spec|
  spec.name          = "cloud_connect-decoder"
  spec.version       = CloudConnect::Decoder::VERSION
  spec.authors       = ["Tyler Sampson"]
  spec.email         = ["git@tylersampson.com"]

  spec.summary       = 'Utility to decode Cloud Connect notifications'
  spec.description   = 'Utility to decode Cloud Connect notifications. Provides helper models'
  spec.homepage      = 'https://github.com/tylersampson/cloud_connect-decoder'
  spec.licenses         = ['MIT']

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
