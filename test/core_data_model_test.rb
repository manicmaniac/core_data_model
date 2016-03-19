require 'test_helper'

class CoreDataModelTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CoreDataModel::VERSION
  end
end
