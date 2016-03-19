require 'test_helper'

class ConfigurationTest < Minitest::Test
  XML = '<configuration name="name" />'.freeze

  def setup
    @configuration = ParseHelper.parse(XML).configuration
  end

  def test_name
    assert_equal 'name', @configuration.name
  end

  class ParseHelper
    include SAXMachine

    element :configuration, class: CoreDataModel::Configuration
  end
end
