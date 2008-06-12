
spec = Gem::Specification.new do |s|
  
  s.name     = "preferences"
  s.version  = "0.1.1"
  s.summary  = "An easy, cross-platform way to manage application configuration data"
  s.homepage = "http://peervoice.com/software/ruby/preferences"
  
  s.author   = "David Dollar"
  s.email    = "ddollar@gmail.com"
  
  s.files    = ["doc/output","doc/output/coverage","doc/output/coverage/index.html","doc/output/coverage/lib-preferences-manager_rb.html","doc/output/coverage/lib-preferences-platform_rb.html","doc/output/coverage/lib-preferences_rb.html","doc/output/coverage/spec-manager_spec_rb.html","doc/output/coverage/spec-platform_spec_rb.html","lib/preferences","lib/preferences/manager.rb","lib/preferences/platform.rb","lib/preferences.rb"]
  s.platform = Gem::Platform::RUBY
                   
  s.rubyforge_project = "preferences"
  s.require_path      = "lib"
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README"]
  
end