require 'core_data_model/models/property'

module CoreDataModel
  class Relationship < Property
    attribute :toMany, as: :to_many, default: false, &:to_b
    attribute :minCount, as: :min_count, class: Integer
    attribute :maxCount, as: :max_count, class: Integer
    attribute :deletionRule, as: :deletion_rule, class: Symbol
    attribute :ordered, default: false, &:to_b
    attribute :destinationEntity, as: :destination_entity_name
    attribute :inverseName, as: :inverse_name
    attribute :inverseEntity, as: :inverse_entity_name

    alias to_many? to_many
    alias ordered? ordered

    def to_one?
      !to_many?
    end

    def destination_entity
      @destination_entity ||= entity.model.entities.detect do |entity|
        entity.name == destination_entity_name
      end
    end

    def inverse_entity
      @inverse_entity ||= entity.model.entities.detect do |entity|
        entity.name == inverse_entity_name
      end
    end

    def type(with_optional: true)
      user_defined_type ||
        case
        when ordered?
          'NSOrderedSet'
        when to_many?
          "Set<#{destination_entity.class_name}>"
        else
          destination_entity.class_name + ('?' if with_optional && optional?)
        end
    end
  end
end
