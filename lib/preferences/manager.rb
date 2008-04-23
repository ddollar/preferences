require 'yaml'

module Preferences
  class Manager < Hash
    
    attr_accessor :filename
    
    def initialize(config_name, directory=nil)
      directory ||= Platform::config_directory
      @filename = File.join(directory, ".#{config_name}")
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
    
  end
end