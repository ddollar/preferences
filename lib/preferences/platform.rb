module Preferences
  class Platform

    def self.config_directory_system
      dir = case RUBY_PLATFORM
        when /win32/ then nil
        else              '/etc'
      end
      raise EnvironmentException, "Can't determine a preferences directory." unless dir
      dir
    end

    def self.config_directory_user
      dir = case RUBY_PLATFORM
        when /win32/ then ENV['APPDATA'] || ENV['USERPROFILE'] || ENV['HOME']
        else              ENV['HOME'] || File.expand_path('~')
      end
      raise EnvironmentException, "Can't determine a preferences directory." unless dir
      dir
    end

    def self.config_directory_test
      dir = case RUBY_PLATFORM
        when /win32/ then nil
        else              '/tmp'
      end
      raise EnvironmentException, "Can't determine a preferences directory." unless dir
      dir
    end

  end
end