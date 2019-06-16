$:.push File.expand_path("lib", __dir__)

require_relative "lib/apexcharts/version"

Gem::Specification.new do |spec|
  spec.name        = "apexcharts"
  spec.version     = Apexcharts::VERSION
  spec.authors     = ["Adrian Setyadi"]
  spec.email       = ["a.styd@yahoo.com"]
  spec.homepage    = "https://github.com/styd/apexcharts.rb"
  spec.summary     = "Beautiful and interactive web charts for rubyist."
  spec.description = "Create interactive web charts with apexcharts.js in ruby."
  spec.license     = "MIT"

  spec.files = Dir["{lib,vendor}/**/*", "LICENSE", "README.md"]

  spec.add_dependency "smart_kv", "0.2.7"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end