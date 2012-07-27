$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_unpublish/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_unpublish"
  s.version     = RailsAdminUnpublish::VERSION
  s.authors     = ["TODO: Hasan Iskandar"]
  s.email       = ["TODO: hasan.iskandar@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminUnpublish."
  s.description = "TODO: Description of RailsAdminUnpublish."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.5"

  s.add_development_dependency "sqlite3"
end
