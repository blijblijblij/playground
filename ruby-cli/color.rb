#!/usr/bin/env ruby

require 'rainbow'
require 'rainbow/ext/string'

puts Rainbow('this is red').red + ' and ' +
     Rainbow('this on yellow bg').bg(:yellow) + ' and ' +
     Rainbow('even bright underlined!').underline.bright

puts 'this is red'.color(:red) + ' and ' +
     'this on yellow bg'.background(:yellow) + ' and ' +
     'even bright underlined!'.underline.bright
