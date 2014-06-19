# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'require_date'

Gem::Specification.new do |spec|
  spec.name          = 'require_date'
  spec.version       = RequireDate::VERSION
  spec.authors       = ["Keith Thibodeaux"]
  spec.email         = ["keith@railscoder.net"]
  spec.summary       = 'Easily require date arguments'
  spec.description   = 'Easily require date arguments for command line apps.  Includes some formats by default but can have custom regexp set.  Pass a block to override raising an argument error if the fetch fails.'
  spec.homepage      = 'https://github.com/kthibodeaux/require_date'
  spec.licenses      = ['MIT']

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
end
