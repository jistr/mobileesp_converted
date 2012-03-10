#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Download Java MobileESP source code to ./tmp directory."
task :download_source do
  `mkdir -p tmp`
  `cd tmp; wget http://mobileesp.googlecode.com/svn/Java/UAgentInfo.java`
end
