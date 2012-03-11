#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Download Java MobileESP source code to ./tmp directory."
task :download_source do
  `mkdir -p java_source`
  `cd java_source; wget http://mobileesp.googlecode.com/svn/Java/UAgentInfo.java`
end
