require 'sax-machine'
require 'core_data_model/models/entity'
require 'core_data_model/models/fetch_request'
require 'core_data_model/models/configuration'

module CoreDataModel
  class Model
    include SAXMachine

    attribute :userDefinedModelVersionIdentifier,
              as: :user_defined_model_version_identifier
    attribute :type
    attribute :documentVersion, as: :document_version
    attribute :lastSavedToolsVersion,
              as: :last_saved_tools_version,
              class: Integer
    attribute :systemVersion, as: :system_version
    attribute :minimumToolsVersion, as: :minimum_tools_version

    elements :entity, as: :entities, class: Entity
    elements :fetchRequest, as: :fetch_requests, class: FetchRequest
    elements :configuration, as: :configurations, class: Configuration
  end
end
