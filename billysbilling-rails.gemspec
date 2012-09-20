# -*- encoding: utf-8 -*-
require File.expand_path('../lib/billys_billing/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Johan Frølich"]
  gem.email         = ["johanfrolich@gmail.com"]
  gem.description   = "A API for the danish accounting program, Billys Billing"
  gem.summary       = "A API for the danish accounting program, Billys Billing"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "billysbilling-rails"
  gem.require_paths = ["lib"]
  gem.version       = BillysBilling::Version.to_s
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "growl"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "vcr"
  
  gem.add_dependency "activesupport" 
  gem.add_dependency "activerecord" 
  gem.add_dependency "httparty"
end
