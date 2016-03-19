require 'test_helper'

class ModelTest < Minitest::Test
  XML = <<-XML.freeze
  <model userDefinedModelVersionIdentifier="version 1"
         type="com.apple.IDECoreDataModeler.DataModel" documentVersion="1.0"
         lastSavedToolsVersion="9525" systemVersion="14F27"
         minimumToolsVersion="Automatic">
    <entity name="Entity" />
    <fetchRequest name="FetchRequest" />
    <configuration name="Configuration" />
    <elements />
  </model>
  XML

  def setup
    @model = ParseHelper.parse(XML).model
  end

  def test_user_defined_model_version_identifier
    assert_equal 'version 1', @model.user_defined_model_version_identifier
  end

  def test_type
    assert_equal 'com.apple.IDECoreDataModeler.DataModel', @model.type
  end

  def test_document_version
    assert_equal '1.0', @model.document_version
  end

  def test_last_saved_tools_version
    assert_equal 9525, @model.last_saved_tools_version
  end

  def test_system_version
    assert_equal '14F27', @model.system_version
  end

  def test_minimum_tools_version
    assert_equal 'Automatic', @model.minimum_tools_version
  end

  def test_entities
    assert_instance_of CoreDataModel::Entity, @model.entities.first
  end

  def test_fetch_requests
    assert_instance_of CoreDataModel::FetchRequest, @model.fetch_requests.first
  end

  def test_configurations
    assert_instance_of CoreDataModel::Configuration, @model.configurations.first
  end

  class ParseHelper
    include SAXMachine

    element :model, class: CoreDataModel::Model
  end
end
