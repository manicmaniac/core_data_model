require 'test_helper'

module RelationshipTest
  class MinimalExample < Minitest::Test
    XML = <<-XML.freeze
    <relationship name="name" destinationEntity="Destination" />
    XML

    def setup
      @relationship = ParseHelper.parse(XML).relationship
    end

    def test_name
      assert_equal 'name', @relationship.name
    end

    def test_optional?
      refute @relationship.optional?
    end

    def test_transient?
      refute @relationship.transient?
    end

    def test_to_many?
      refute @relationship.to_many?
    end

    def test_min_count
      assert_nil @relationship.min_count
    end

    def test_max_count
      assert_nil @relationship.max_count
    end

    def test_deletion_rule
      assert_nil @relationship.deletion_rule
    end

    def test_ordered?
      refute @relationship.ordered?
    end

    def test_destination_entity_name
      assert_equal 'Destination', @relationship.destination_entity_name
    end
  end

  class ComplexExample < Minitest::Test
    XML = <<-XML.freeze
    <relationship name="name" optional="YES" transient="YES" toMany="YES"
                  minCount="1" maxCount="2" deletionRule="Cascade"
                  ordered="YES" destinationEntity="Destination"
                  inverseName="inverseName" inverseEntity="InverseEntityName"
                  spotlightIndexingEnabled="YES" storedInTruthFile="YES"
                  syncable="YES">
      <userInfo>
        <entry key="key" value="value" />
      </userInfo>
    </relationship>
    XML

    def setup
      @relationship = ParseHelper.parse(XML).relationship
    end

    def test_name
      assert_equal 'name', @relationship.name
    end

    def test_optional?
      assert @relationship.optional?
    end

    def test_transient?
      assert @relationship.transient?
    end

    def test_to_many?
      assert @relationship.to_many?
    end

    def test_min_count
      assert_equal 1, @relationship.min_count
    end

    def test_max_count
      assert_equal 2, @relationship.max_count
    end

    def test_deletion_rule
      assert_same :cascade, @relationship.deletion_rule
    end

    def test_ordered?
      assert @relationship.ordered?
    end

    def test_destination_entity_name
      assert_equal 'Destination', @relationship.destination_entity_name
    end

    def test_inverse_name
      assert_equal 'inverseName', @relationship.inverse_name
    end

    def test_inverse_entity_name
      assert_equal 'InverseEntityName', @relationship.inverse_entity_name
    end

    def test_indexed_by_spotlight?
      assert @relationship.indexed_by_spotlight?
    end

    def test_stored_in_external_record?
      assert @relationship.stored_in_external_record?
    end

    def test_syncable?
      assert @relationship.syncable?
    end
  end

  class ParseHelper
    include SAXMachine

    element :relationship, class: CoreDataModel::Relationship
  end
end
