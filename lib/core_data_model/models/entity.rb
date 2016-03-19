require 'sax-machine'
require 'wannabe_bool'
require 'core_data_model/models/attribute'
require 'core_data_model/models/relationship'
require 'core_data_model/models/fetched_property'
require 'core_data_model/models/user_info'

module CoreDataModel
  class Entity
    include SAXMachine

    ancestor :model

    attribute :name
    attribute :representedClassName, as: :represented_class_name
    attribute :parentEntity, as: :super_entity_name
    attribute :isAbstract, default: false, as: :abstract, &:to_b
    attribute :elementID, as: :renaming_identifier
    attribute :versionHashModifier, as: :version_hash_modifier
    attribute :syncable, default: false, &:to_b

    elements :attribute, as: :attributes, class: Attribute
    elements :relationship, as: :relationships, class: Relationship
    elements :fetchedProperty, as: :fetched_properties, class: FetchedProperty

    element :userInfo, as: :user_info, class: UserInfo

    alias abstract? abstract
    alias syncable? syncable

    def module_name
      represented_class_name.rpartition('.').first
    end

    def class_name
      represented_class_name.rpartition('.').last
    end

    def super_entity
      @super_entity ||= model.entities.detect do |entity|
        entity.name == super_entity_name
      end
    end

    def super_class_name
      super_entity ? super_entity.class_name : 'NSManagedObject'
    end

    def properties
      attributes + relationships + fetched_properties
    end
  end
end
