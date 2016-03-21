require 'test_helper'

class CoreDataModelDTest < Minitest::Test
  def setup
    @path = FIXTURES_PATH + '/model.xcdatamodeld'
    @model_d = CoreDataModel::CoreDataModelD.new(@path)
  end

  def test_path_is_a_pathname_object
    assert_instance_of Pathname, @model_d.path
  end

  def test_path_is_same_as_given_path
    assert_equal @path, @model_d.path.to_s
  end

  def test_versions_include_all_versions
    assert_equal 2, @model_d.versions.count
  end

  def test_versions_include_current_version
    assert_includes @model_d.versions, @model_d.current_version
  end

  def test_model_is_a_model_object
    assert_instance_of CoreDataModel::Model, @model_d.model
  end
end
