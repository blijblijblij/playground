#!/usr/bin/env ruby

require 'slop'

opts = Slop.parse do |o|
  o.string '-h', '--hosts', 'a comma separated list of aws hostnames'
  o.string '-m', '--mesosservices', 'a comma separated list of mesos services'
  o.string '-s', '--state', 'on or off'
end

ARGV

begin
  puts opts[:hosts]
  puts opts[:mesosservices]
  puts opts[:state]
  raise 'An error has occured.'
rescue
  puts opts
end
