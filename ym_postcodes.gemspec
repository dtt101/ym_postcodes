# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ym_postcodes/version'

Gem::Specification.new do |spec|
  spec.name          = "ym_postcodes"
  spec.version       = YmPostcodes::VERSION
  spec.authors       = ["David Thompson"]
  spec.email         = ["david@yoomee.com"]
  spec.summary       = 'Wrapper for the postcodes.io API'
  spec.description   = 'postcodes.io provides free postcode and gelocation data for the UK'
  spec.homepage      = "http://www.yoomee.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "webmock"
end
