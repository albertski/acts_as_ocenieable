require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :setup_and_run_tests

desc 'Setup and run all tests'
task :setup_and_run_tests do
  unless File.exist?('dummy/config/environment.rb')
    Rake::Task[:dummy_generate].invoke
    open('dummy/Gemfile', 'a') { |f|
      f.puts "gem 'acts_as_ocenieable', path: '../../'"
    }
    system('cd dummy && bundle install')
  end
  Rake::Task[:dummy_copy_fixtures].invoke
  system('bundle exec rspec')
end

desc 'Generate dummy application for test cases'
task :dummy_generate do
  Rake::Task[:dummy_remove].invoke
  puts 'Creating dummy application to run tests'
  system('rails new dummy --database=sqlite3')
  FileUtils.rm_r Dir.glob('dummy/test/*')
end

desc 'Copy Files to dummy application'
task :dummy_copy_fixtures do
  dummy_path = 'dummy'
  FileUtils.cp_r 'spec/fixtures/app', dummy_path
  FileUtils.cp_r 'spec/fixtures/config', dummy_path
  FileUtils.cp_r 'spec/fixtures/db', dummy_path
end

desc 'Remove dummy application'
task :dummy_remove do
  FileUtils.rm_r Dir.glob('dummy/')
end
