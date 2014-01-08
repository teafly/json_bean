# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_bean/version'

Gem::Specification.new do |spec|
  spec.name          = "json_bean"
  spec.version       = JsonBean::VERSION
  spec.authors       = ["teafly"]
  spec.email         = ["orgteafly@gmail.com"]
  spec.summary       = %q{hello}
  spec.description   = %q{hello}
  spec.homepage      = "https://github.com/teafly/json_bean"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
