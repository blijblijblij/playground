#!/usr/bin/env ruby

require 'optparse'
require 'optparse/time'

OptionParser.new do |parser|
  parser.on('-t', '--time [TIME]', Time,
            'Begin execution at given time') do |time|
    p time
  end
end.parse!
