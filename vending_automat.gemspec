# frozen_string_literal: true

require_relative 'lib/vending_automat/version'

Gem::Specification.new do |spec|
  spec.name          = 'vending_automat'
  spec.version       = VendingAutomat::VERSION
  spec.authors       = ['Oleg Starosvitskij']
  spec.email         = ['oleg.starosvitskij@gmail.com']

  spec.summary       = 'Just for fun gem'
  spec.description   = 'This gem emulate the behive of vending machine - we can insert coins, buy products, receive change'
  spec.homepage      = 'https://github.com/olegsta/vending_automat'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.2')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['README.md', 'LICENSE',
  'CHANGELOG.md', 'lib/**/*.rb',
  'Gemfile']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  #spec.add_dependency("warden", "~> 1.2.3")
  #spec.add_dependency("warden", "~> 1.2.3")
end
