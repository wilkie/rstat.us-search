# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rstat.us-search/version'

Gem::Specification.new do |gem|
  gem.name          = "rstat.us-foo"
  gem.version       = RstatUs::Search::VERSION
  gem.authors       = ["wilkie"]
  gem.email         = ["wilkie05@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "tire", "~> 0.4.1"
end