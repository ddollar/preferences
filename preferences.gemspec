
spec = Gem::Specification.new do |s|
  
  s.name     = "preferences"
  s.version  = "0.0.3"
  s.summary  = "An easy, cross-platform way to manage application configuration data"
  s.homepage = "http://peervoice.com/software/ruby/preferences"
  
  s.author   = "David Dollar"
  s.email    = "ddollar@gmail.com"
  
  s.files    = ["lib/preferences","lib/preferences/manager.rb","lib/preferences/platform.rb","lib/preferences.rb","test/preferences.rb"]
  s.platform = Gem::Platform::RUBY
                   
  s.rubyforge_project = "preferences"
  s.require_path      = "lib"
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README"]
  
end