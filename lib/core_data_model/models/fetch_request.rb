require 'wannabe_bool'

module CoreDataModel
  class FetchRequest
    include SAXMachine

    ancestor :ancestor

    attribute :name
    attribute :entity, as: :entity_name
    attribute :predicateString, as: :predicate_string
    attribute :fetchLimit, as: :fetch_limit, class: Integer
    attribute :fetchBatchSize, as: :fetch_batch_size, class: Integer
    attribute :includeSubentities,
              as: :include_subentities,
              default: false,
              &:to_b
    attribute :includePropertyValues,
              as: :include_property_values,
              default: false,
              &:to_b
    attribute :includePendingChanges,
              as: :include_pending_changes,
              default: false,
              &:to_b
    attribute :returnObjectsAsFaults,
              as: :return_objects_as_faults,
              default: false,
              &:to_b
    attribute :returnDistinctResults,
              as: :return_distinct_results,
              default: false,
              &:to_b

    alias include_subentities? include_subentities
    alias include_property_values? include_property_values
    alias include_pending_changes? include_pending_changes
    alias return_objects_as_faults? return_objects_as_faults
    alias return_distinct_results? return_distinct_results

    def model
      if ancestor.is_a?(Model)
        ancestor
      else
        fetched_property.entity.model
      end
    end

    def fetched_property
      ancestor if ancestor.is_a?(FetchedProperty)
    end

    def entity
      model.entities.detect do |entity|
        entity.name == entity_name
      end
    end
  end
end
