# frozen_string_literal: true

require 'rake'
require 'rake/testtask'
require 'robot-controller/tasks'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new do |task|
    task.fail_on_error = true
  end
rescue LoadError
  task :rubocop do
    raise 'Unable to load rubocop'
  end
end

# Import external rake tasks
Dir.glob('lib/tasks/*.rake').each { |r| import r }

task default: :ci

desc 'run continuous integration suite (tests, coverage, rubocop lint)'
task :ci => [:rubocop, :spec]

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  task :spec do
    puts 'RSpec is not installed'
  end
end

desc 'Get application version'
task :app_version do
  puts File.read(File.expand_path('../VERSION', __FILE__)).chomp
end

desc 'Load complete environment into rake process'
task :environment do
  require_relative 'config/boot'
end
