require 'erb'
require 'yaml'

namespace :gemspec do

  desc "Build gemspec"
  task :build do
    config = OpenStruct.new
  
    config.name     = "preferences"
    config.version  = "0.0.3"
    config.summary  = "An easy, cross-platform way to manage application configuration data"
    config.homepage = "http://peervoice.com/software/ruby/preferences"
  
    config.author_name  = "David Dollar"
    config.author_email = "ddollar@gmail.com"
  
    config.files = FileList["{bin,doc,lib,test}/**/*"].exclude("rdoc").to_a.map do |file|
      '"' + file + '"'
    end.join(',')

    File.open("templates/#{config.name}.gemspec.erb", "r") do |template|
      File.open("#{config.name}.gemspec", "w") do |gemspec|
        template_data =  "<% config = YAML::load(%{#{Regexp.escape(YAML::dump(config))}}) %>\n"
        template_data += template.read
        original_stdout = $stdout
        $stdout = gemspec
        ERB.new(template_data).run
        $stdout = original_stdout
      end
    end
  end
  
  desc "Test gemspec against Github"
  task :test do
    require 'rubygems/specification'
    data = File.read('preferences.gemspec')
    spec = nil
    Thread.new { spec = eval("$SAFE = 3\n#{data}") }.join
    puts spec
  end
  
end