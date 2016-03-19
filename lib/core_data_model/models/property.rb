require 'sax-machine'
require 'wannabe_bool'
require 'core_data_model/models/user_info'

module CoreDataModel
  class Property
    include SAXMachine

    ancestor :entity

    attribute :name
    attribute :optional, default: false, &:to_b
    attribute :transient, default: false, &:to_b
    attribute :syncable, default: false, &:to_b
    attribute :indexed, default: false, &:to_b
    attribute :spotlightIndexingEnabled,
              as: :indexed_by_spotlight,
              default: false,
              &:to_b
    attribute :versionHashModifier, as: :version_hash_modifier
    attribute :elementID, as: :renaming_identifier
    attribute :storedInTruthFile,
              as: :stored_in_external_record,
              default: false,
              &:to_b

    element :userInfo, as: :user_info, class: UserInfo

    alias optional? optional
    alias transient? transient
    alias syncable? syncable
    alias indexed? indexed
    alias indexed_by_spotlight? indexed_by_spotlight
    alias stored_in_external_record? stored_in_external_record

    def user_defined_type
      user_info['type'] if user_info
    end

    def access_modifier
      if user_info
        user_info['access_modifier'] || 'public'
      else
        'public'
      end
    end
  end
end
