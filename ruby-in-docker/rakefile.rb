require 'tmpdir'
require 'awesome_print'
require 'etc'

SHELL = ENV['SHELL'] || '/bin/zsh'

desc 'hello world'
task :hello do
  puts 'helloworld'
end
