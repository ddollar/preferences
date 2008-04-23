#!/usr/bin/env ruby

require 'helper.rb'

preferences = Preferences::Manager.new :preferences_test, true
puts "GLOBAL : #{preferences.filename}"

preferences = Preferences::Manager.new :preferences_test, false
puts "USER   : #{preferences.filename}"
