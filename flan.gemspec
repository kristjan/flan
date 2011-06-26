# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "flan/version"

Gem::Specification.new do |s|
  s.name        = "flan"
  s.version     = Flan::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kristán Pétursson"]
  s.email       = ["kristjan@gmail.com`"]
  s.homepage    = "https://github.com/kristjan/flan"
  s.summary     = %q{FLash ANalytics}
  s.description = %q{A server-client bridge to Google Analytics using Rails' flash}

  s.rubyforge_project = "flan"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
