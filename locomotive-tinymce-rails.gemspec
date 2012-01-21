# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'tinymce/rails/version'

Gem::Specification.new do |s|
  s.name = 'locomotive-tinymce-rails'
  s.version = TinyMCE::Rails::VERSION
  s.summary = 'Rails 3.1 integration for TinyMCE.'
  s.description = 'Seamlessly integrates TinyMCE into the Rails 3.1 asset pipeline.'
  s.homepage    = 'https://github.com/locomotivecms/tinymce-rails'
  s.files = Dir['README.md', 'LICENSE', 'Rakefile', 'app/**/*', 'lib/**/*', 'vendor/**/*']
  s.authors = ['Sam Pohlenz', 'Didier Lafforgue']
  s.email = 'sam@sampohlenz.com'

  s.add_dependency 'actionpack',  '~> 3.1.3'

  s.add_development_dependency 'rake', '0.9.2'
end
