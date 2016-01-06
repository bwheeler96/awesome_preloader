$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "awesome_preloader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "awesome_preloader"
  s.version     = AwesomePreloader::VERSION
  s.authors     = ["Brian Wheeler"]
  s.email       = ["bwheeler96@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of AwesomePreloader."
  s.description = "Description of AwesomePreloader."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
