require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# We don't want to release this publicly
Rake::Task["release"].clear

desc "Launch a console with Sequences loaded"
task :console do
  require_relative "lib/sequences"
  require "stringio"
  # trick IRb into thinking it was launched normally (for setup files and such)
  ARGV.clear
  $PROGRAM_NAME = 'irb'

  require "irb"
  IRB.start
end
