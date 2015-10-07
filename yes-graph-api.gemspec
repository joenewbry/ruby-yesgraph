# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yes/graph/api/version'

Gem::Specification.new do |spec|
  spec.name          = "yes-graph-api"
  spec.version       = Yes::Graph::Api::VERSION
  spec.authors       = ["Joe Newbry"]
  spec.email         = ["joenewbry@gmail.com"]

  spec.summary       = %q{Ruby wrapper for YesGraph API}
  spec.description   = %q{Have users and want to grow. YesGraph helps with that!}
  spec.homepage      = "www.github.com/joenewbry/ruby-yesgraph"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
