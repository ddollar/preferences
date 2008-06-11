#!/usr/bin/env ruby

require 'helper.rb'

preferences = Preferences::Manager.new :preferences_test, {:autosave => true}
preferences[:foo] = 'barnoo'
preferences[:fred] = ['barney', 'rubble']
preferences[:alice] = { :owner => 'bob' }
pp preferences

preferences_test = Preferences::Manager.new :preferences_test
pp preferences_test

puts (preferences_test == preferences) ? "OK" : "FAIL"
