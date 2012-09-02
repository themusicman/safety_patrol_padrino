# -*- encoding: utf-8 -*-
require File.expand_path('../lib/safety_patrol/padrino', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Brewer"]
  gem.email         = ["tom@21purple.com"]
  gem.description   = %q{A few helpers for SafetyPatrol and Pardino}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "safety_patrol_padrino"
  gem.require_paths = ["lib"]
  gem.version       = SafetyPatrol::Padrino::VERSION
  gem.add_development_dependency('rspec')
  gem.add_dependency('safety_patrol')
end
