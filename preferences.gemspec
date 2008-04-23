require 'rubygems'
require 'rake/gempackagetask'
require 'pp'

spec = Gem::Specification.new do |s|
  
  s.name     = "preferences"
  s.version  = "0.0.3"
  s.summary  = "An easy, cross-platform way to manage application configuration data"
  s.homepage = "http://peervoice.com/software/ruby/preferences"

  s.author   = "David Dollar"
  s.email    = "ddollar@peervoice.com"

  s.files    = FileList["{bin,doc,lib,test}/**/*"].exclude("rdoc").to_a
  s.platform = Gem::Platform::RUBY
                   
  s.require_path      = "lib"
  s.autorequire       = s.name
  s.test_file         = "test/#{s.name}.rb"
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README"]
  
  pp s.files
  
end

if $0 == __FILE__
  Gem::manage_gems
  gemfile = Gem::Builder.new(spec).build
  Dir.mkdir('pkg') unless File.exists?('pkg')
  File.rename(gemfile, "pkg/#{gemfile}")
end
