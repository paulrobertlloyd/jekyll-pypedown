# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-pypedown/version'

Gem::Specification.new do |spec|
  spec.name        = "jekyll-pypedown"
  spec.version     = Jekyll::Pypedown::VERSION
  spec.summary     = "Pygments + Typogruby + kramdown for Jekyll"
  spec.description = "A Jekyll plugin that enables Pygments syntax highlighting for kramdown-parsed fenced code blocks."
  spec.authors     = ["Paul Robert Lloyd"]
  spec.email       = "me+rubygems@paulrobertlloyd.com"
  spec.files       = Dir.glob("lib/**/*.rb")
  spec.homepage    = "https://github.com/paulrobertlloyd/jekyll-pypedown"
  spec.license     = "MIT"

  spec.add_dependency "jekyll", "~> 2.4"
  spec.add_dependency "pygments.rb", "~> 0.6"
  spec.add_dependency "typogruby", "~> 1.0"
  spec.add_dependency "kramdown", "~> 1.4"
end
