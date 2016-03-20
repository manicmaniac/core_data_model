require 'test_helper'

module EntityTest
  class MinimalExample < Minitest::Test
    XML = '<entity name="name" />'.freeze

    def setup
      @entity = ParseHelper.parse(XML).entity
    end

    def test_name
      assert_equal 'name', @entity.name
    end

    def test_abstract?
      refute @entity.abstract?
    end

    def test_concrete?
      assert @entity.concrete?
    end

    def test_syncable?
      refute @entity.syncable?
    end

    def test_attributes
      assert_empty @entity.attributes
    end

    def test_relationships
      assert_empty @entity.relationships
    end

    def test_fetched_properties
      assert_empty @entity.fetched_properties
    end

    def test_user_info
      assert_nil @entity.user_info
    end
  end

  class InheritanceExample < Minitest::Test
    XML = <<-XML.freeze
      <entity name="name" representedClassName="Module.RepresentedClass"
              parentEntity="ParentEntity" isAbstract="YES">
      </entity>
    XML

    def setup
      @entity = ParseHelper.parse(XML).entity
    end

    def test_super_entity_name
      assert_equal 'ParentEntity', @entity.super_entity_name
    end

    def test_abstract?
      assert @entity.abstract?
    end

    def test_concrete?
      refute @entity.concrete?
    end

    def test_represented_class_name
      assert_equal 'Module.RepresentedClass', @entity.represented_class_name
    end

    def test_module_name
      assert_equal 'Module', @entity.module_name
    end

    def test_class_name
      assert_equal 'RepresentedClass', @entity.class_name
    end
  end

  class ParseHelper
    include SAXMachine

    element :entity, class: CoreDataModel::Entity
  end
end
