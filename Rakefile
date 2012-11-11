#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

task :default => [:test]

desc "Download Java MobileESP source code to ./tmp directory."
task :download_source do
  `mkdir -p java_source`
  `cd java_source; rm UAgentInfo.java; wget http://mobileesp.googlecode.com/svn/Java/UAgentInfo.java`
end

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

