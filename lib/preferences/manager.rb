require 'yaml'

module Preferences
  class Manager < Hash
    
    attr_accessor :filename
    
    def initialize(name, settings={})
      
      @type     = settings[:type]     || :user
      @autosave = settings[:autosave] || false
      
      directory = case @type
        when :system then Platform::config_directory_system
        when :user   then Platform::config_directory_user
        when :test   then Platform::config_directory_test
      end
      
      file = case @type
        when :system then "#{name}.conf"
        when :user   then ".#{name}"
        when :test   then "#{name}.preferences.test"
      end
      
      @filename = File.join(directory, file)
      
      if File.exists?(@filename)
        File.open(@filename, "r") do |file|
          self.merge!(YAML.load(file))
        end
      end
    end
    
    def save
      File.open(@filename, "w") do |file|
        YAML.dump(self, file)
      end
    end
    
    alias_method :default_writer, :[]=
    
    def []=(key, value)
      default_writer(key, value)
      save if @autosave
    end
    
  end
end