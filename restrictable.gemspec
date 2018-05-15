$:.push File.expand_path("lib", __dir__)

require "restrictable/version"

Gem::Specification.new do |spec|
  spec.name          = "restrictable"
  spec.version       = Restrictable::VERSION
  spec.authors       = ["Daniel Rejon Pardenilla"]
  spec.email         = ["rejonpardenilla@gmail.com"]

  spec.summary       = %q{Simple authorization gem for Ruby on Rails.}
  spec.description   = %q{Manage authorization restrictions on Ruby on Rails. Ideal for controlling actions of 2 or 3 types of users.}
  spec.homepage      = "http://github.com/rejonpardenilla/restrictable"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files          = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.require_paths  = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "sqlite3"
  spec.add_dependency "rails", "~> 5.0"
end
