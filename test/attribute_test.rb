require 'test_helper'

module AttributeTest
  class MinimalExample < Minitest::Test
    XML = '<attribute name="name" attributeType="Boolean" />'.freeze

    def setup
      @attribute = ParseHelper.parse(XML).attribute
    end

    def test_name
      assert_equal 'name', @attribute.name
    end

    def test_optional?
      refute @attribute.optional?
    end

    def test_transient?
      refute @attribute.transient?
    end

    def test_attribute_type
      assert_equal 'Boolean', @attribute.attribute_type
    end

    def test_allows_external_binary_data_storage?
      refute @attribute.allows_external_binary_data_storage?
    end

    def test_indexed?
      refute @attribute.indexed?
    end

    def test_indexed_by_spotlight?
      refute @attribute.indexed_by_spotlight?
    end

    def test_version_hash_modifier
      assert_nil @attribute.version_hash_modifier
    end

    def test_renaming_identifier
      assert_nil @attribute.renaming_identifier
    end

    def syncable?
      refute @attribute.syncable?
    end
  end

  class ComplexBinaryExample < Minitest::Test
    XML = <<-XML.freeze
    <attribute name="name" optional="YES" transient="YES" attributeType="Binary"
              allowsExternalBinaryDataStorage="YES" indexed="YES"
              spotlightIndexingEnabled="YES" versionHashModifier="foo"
              elementID="bar" syncable="YES">
      <userInfo>
        <entry key="key" value="value" />
      </userInfo>
    </attribute>
    XML

    def setup
      @attribute = ParseHelper.parse(XML).attribute
    end

    def test_name
      assert_equal 'name', @attribute.name
    end

    def test_optional?
      assert @attribute.optional?
    end

    def test_transient?
      assert @attribute.transient?
    end

    def test_attribute_type
      assert_equal 'Binary', @attribute.attribute_type
    end

    def test_allows_external_binary_data_storage?
      assert @attribute.allows_external_binary_data_storage?
    end

    def test_indexed?
      assert @attribute.indexed?
    end

    def test_indexed_by_spotlight?
      assert @attribute.indexed_by_spotlight?
    end

    def test_version_hash_modifier
      assert_equal 'foo', @attribute.version_hash_modifier
    end

    def test_renaming_identifier
      assert_equal 'bar', @attribute.renaming_identifier
    end

    def syncable?
      assert @attribute.syncable?
    end
  end

  class BooleanExample < Minitest::Test
    XML = <<-XML.freeze
    <attribute name="name" optional="YES" transient="YES"
               attributeType="Boolean" defaultValueString="YES" />
    XML

    def setup
      @attribute = ParseHelper.parse(XML).attribute
    end

    def test_default_value_string
      assert_equal 'YES', @attribute.default_value_string
    end

    def test_default_value
      assert_equal true, @attribute.default_value
    end
  end

  class DateExample < Minitest::Test
    XML = <<-XML.freeze
    <attribute name="name" optional="YES" transient="YES"
               attributeType="Date" minDateTimeInterval="0"
               maxDateTimeInterval="1" defaultDateTimeInterval="0.5" />
    XML

    def setup
      @attribute = ParseHelper.parse(XML).attribute
    end

    def test_min_date_time_interval
      assert_equal 0.0, @attribute.min_date_time_interval
    end

    def test_max_date_time_interval
      assert_equal 1.0, @attribute.max_date_time_interval
    end

    def test_default_date_time_interval
      assert_equal 0.5, @attribute.default_date_time_interval
    end

    def test_min_value
      assert_equal 0.0, @attribute.min_value
    end

    def test_max_value
      assert_equal 1.0, @attribute.max_value
    end

    def test_default_value
      assert_equal 0.5, @attribute.default_value
    end

    def test_type
      assert_equal 'NSDate?', @attribute.type
    end
  end

  class ParseHelper
    include SAXMachine

    element :attribute, class: CoreDataModel::Attribute
  end
end
