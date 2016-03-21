require 'test_helper'

module FetchRequestTest
  class MinimalExample < Minitest::Test
    XML = <<-XML.freeze
    <fetchRequest name="name" entity="EntityName"
                  predicateString="test = &quot;test&quot;" />'
    XML

    def setup
      @fetch_request = ParseHelper.parse(XML).fetch_request
    end

    def test_name
      assert_equal 'name', @fetch_request.name
    end

    def test_entity_name
      assert_equal 'EntityName', @fetch_request.entity_name
    end

    def test_predicate_string
      assert_equal 'test = "test"', @fetch_request.predicate_string
    end

    def test_fetch_limit
      assert_nil @fetch_request.fetch_limit
    end

    def test_fetch_batch_size
      assert_nil @fetch_request.fetch_batch_size
    end

    def test_include_subentities?
      refute @fetch_request.include_subentities?
    end

    def test_include_property_values?
      refute @fetch_request.include_property_values?
    end

    def test_include_pending_changes?
      refute @fetch_request.include_pending_changes?
    end

    def test_return_objects_as_faults?
      refute @fetch_request.return_objects_as_faults?
    end

    def test_return_distinct_results?
      refute @fetch_request.return_distinct_results?
    end
  end

  class ComplexExample < Minitest::Test
    XML = <<-XML.freeze
    <fetchRequest name="name" entity="EntityName"
                  predicateString="test = &quot;test&quot;" fetchLimit="1"
                  fetchBatchSize="100" includeSubentities="YES"
                  includePropertyValues="YES" includePendingChanges="YES"
                  returnObjectsAsFaults="YES" returnDistinctResults="YES" />
    XML

    def setup
      @fetch_request = ParseHelper.parse(XML).fetch_request
    end

    def test_name
      assert_equal 'name', @fetch_request.name
    end

    def test_entity_name
      assert_equal 'EntityName', @fetch_request.entity_name
    end

    def test_predicate_string
      assert_equal 'test = "test"', @fetch_request.predicate_string
    end

    def test_fetch_limit
      assert_equal 1, @fetch_request.fetch_limit
    end

    def test_fetch_batch_size
      assert_equal 100, @fetch_request.fetch_batch_size
    end

    def test_include_subentities?
      assert @fetch_request.include_subentities?
    end

    def test_include_property_values?
      assert @fetch_request.include_property_values?
    end

    def test_include_pending_changes?
      assert @fetch_request.include_pending_changes?
    end

    def test_return_objects_as_faults?
      assert @fetch_request.return_objects_as_faults?
    end

    def test_return_distinct_results?
      assert @fetch_request.return_distinct_results?
    end
  end

  class ParseHelper
    include SAXMachine

    element :fetchRequest,
            as: :fetch_request,
            class: CoreDataModel::FetchRequest
  end
end
