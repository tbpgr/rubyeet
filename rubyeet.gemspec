# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyeet/version'

Gem::Specification.new do |spec|
  spec.name          = "rubyeet"
  spec.version       = Rubyeet::VERSION
  spec.authors       = ["tbpgr"]
  spec.email         = ["tbpgr@tbpgr.jp"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = "https://github.com/tbpgr/rubyeet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "mem"
  spec.add_dependency "thor"
  spec.add_dependency "bundler"
  spec.add_dependency "dotenv"
  spec.add_dependency "rb-readline"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
end
