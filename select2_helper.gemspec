$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'select2_helper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'select2_helper'
  s.version     = Select2Helper::VERSION
  s.authors     = %w[Tony Jian]
  s.email       = %w[tonytonyjan@gmail.com]
  s.homepage    = ''
  s.summary     = 'Select2 Helper'
  s.description = 'Select2 Helper'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.1.1'
  s.add_dependency 'kaminari'
  s.add_dependency 'jbuilder'
  s.add_dependency 'coffee-rails'

  s.add_development_dependency 'pg'
end
