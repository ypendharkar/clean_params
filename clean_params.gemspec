# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clean_params/version'

Gem::Specification.new do |spec|
  spec.name          = "clean_params"
  spec.version       = CleanParams::VERSION
  spec.authors       = ["Yogesh Pendharkar"]
  spec.email         = ["yogesh.pendharkar@gmail.com"]
  spec.description   = %q{Easy and clean way to maintain your params.}
  spec.summary       = %q{Clean your params hash with clean_params}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
