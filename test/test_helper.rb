require 'coveralls'
require 'simplecov'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/test/'
end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sax-machine'
require 'core_data_model'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

FIXTURES_PATH = File.expand_path('../fixtures', __FILE__)
