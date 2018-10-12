require 'rubygems'
require 'bundler'
require 'rake/testtask'

# MiniTest Task
Rake::TestTask.new do |test|
  test.pattern = 'spec/**/*_spec.rb'
end

# We want the test task to be default.
task default: [:test]
