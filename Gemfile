# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dor-services-client', '>= 0.7.0' # 0.7.0 is the first release to have the goobi method call we need
gem 'dor-services', '~> 6.0', '>= 6.0.5'
gem 'honeybadger'
gem 'lyber-core', '~> 4.0', '>= 4.1.3'
gem 'pry'
gem 'rake'
gem 'retries'
gem 'robot-controller', '~> 2.0' # requires Resque
gem 'slop'

group :development, :test do
  gem 'coveralls', require: false
  gem 'rspec'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'webmock'
end

group :development do
  if File.exist?(mygems = File.join(ENV['HOME'], '.gemfile'))
    instance_eval(File.read(mygems))
  end
  gem 'yard'
  gem 'capistrano', '~> 3.0'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'dlss-capistrano'
end
