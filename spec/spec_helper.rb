# Make sure specs run with the definitions from test.rb
ENV['ROBOT_ENVIRONMENT'] = 'test'

require 'simplecov'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.order = 'random'
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

bootfile = File.expand_path(File.dirname(__FILE__) + '/../config/boot')
require bootfile

require 'pry'
require 'rspec'
require 'webmock/rspec'

def setup_work_item(druid)
  @work_item = double('work_item')
  allow(@work_item).to receive_messages(:druid => druid)
end
