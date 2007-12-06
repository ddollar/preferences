#!/usr/bin/env ruby

require 'rubygems'
require 'pp'

if ARGV.length > 0 && ARGV[0] == 'gem'
  require 'preferences'
else
  $:.push('../lib')
  require 'rubygems'
  require 'preferences.rb'
end