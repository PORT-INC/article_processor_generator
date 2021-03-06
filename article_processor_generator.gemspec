$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "article_processor_generator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "article_processor_generator"
  s.version     = ArticleProcessorGenerator::VERSION
  s.authors     = ["port developers"]
  s.email       = ["development@theport.jp"]
  s.homepage    = "https://github.com/PORT-INC/article_processor_generator"
  s.summary     = "article_processor_generator"
  s.description = "article_processor_generator"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5"

  s.add_development_dependency "sqlite3"
end
