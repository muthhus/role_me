$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "role_me/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "role_me"
  s.version     = RoleMe::VERSION
  s.authors     = ["Tiago Scolari"]
  s.email       = ["tscolari@gmail.com"]
  s.homepage    = "https://github.com/tscolari/role_me"
  s.summary     = "Simple Role Handling to Models"
  s.description = "An easy way to add roles to your model."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"

  s.add_development_dependency "sqlite3"
end
