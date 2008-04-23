require 'yaml'

module Preferences
  class Manager < Hash
    
    attr_accessor :filename
    
    def initialize(config_name, global=false)
      directory = global ? Platform::config_directory_global :
                           Platform::config_directory_user
                           
      config_file = global ? "#{config_name}.conf" : ".#{config_name}"
                           
      @filename = File.join(directory, config_file)
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