require 'rubygems'
require 'erb'
require 'yaml'
require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'

task :default => [ 'rspec:run' ]

namespace :rdoc do
  
  desc 'Generate RDoc'
  rd = Rake::RDocTask.new(:build) do |rdoc|
    rdoc.rdoc_dir = 'doc/output/rdoc'
    rdoc.options << '--title' << 'Preferences' << '--line-numbers' << '--inline-source' << '--main' << 'README'
    rdoc.rdoc_files.include('README', 'lib/**/*.rb')
  end
  
  desc 'View RDoc'
  task :view => [ :build ] do
    system %{open doc/output/rdoc/index.html}
  end
  
end

namespace :rspec do
  
  desc "Run rspec tasks"
  Spec::Rake::SpecTask.new(:run) do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    #t.spec_opts = ['--options', 'spec/spec.opts']
    unless ENV['NO_RCOV']
      t.rcov = true
      t.rcov_dir = 'doc/output/coverage'
      t.rcov_opts = ['--exclude', 'bin\/rtr,examples,\/var\/lib\/gems,\/Library\/Ruby,\.autotest']
    end
  end
  
  desc "Show code coverage"
  task :coverage => [ :run ] do
    system %{open doc/output/coverage/index.html}
  end
  
  desc "Verify code coverage"
  RCov::VerifyTask.new(:verify => :run) do |t|
    t.threshold = 100.0 # Make sure you have rcov 0.7 or higher!
    t.index_html = 'doc/output/coverage/index.html'
  end
  
end
    
namespace :gem do
  
  desc "Build the gem"
  task :build => [ 'gemspec:build' ] do
    spec = nil
    File.open('preferences.gemspec', 'r') do |gemspec|
      eval gemspec.read
    end
    Gem::manage_gems
    gemfile = Gem::Builder.new(spec).build
    Dir.mkdir('pkg') unless File.exists?('pkg')
    File.rename(gemfile, "pkg/#{gemfile}")
  end

end

namespace :gemspec do

  desc "Build gemspec"
  task :build do
    config = OpenStruct.new
  
    config.name     = "preferences"
    config.version  = "0.1.1"
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