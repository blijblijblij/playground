#!/usr/bin/env ruby

# load_environment
require '/environment'
require 'pry'

puts 'starting app.rb'

# read an env from /environment
puts ENV['HELLO']

# read an env from memory
puts ENV['PLOINK']

sleep 10
