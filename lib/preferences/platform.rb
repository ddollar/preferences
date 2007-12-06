module Preferences
  class Platform
    def Platform.config_directory
      case RUBY_PLATFORM
      when /win32/
        dir = 
          ENV['APPDATA'] ||  # C:\Documents and Settings\name\Application Data
          ENV['USERPROFILE'] || # C:\Documents and Settings\name
          ENV['HOME']

      else
        dir =
          ENV['HOME'] ||
          File.expand_path('~')
      end

      unless dir
        raise EnvironmentException, "Can't determine a preferences directory."
      end
      
      dir
    end
  end
end