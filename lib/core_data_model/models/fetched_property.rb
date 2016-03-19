require 'core_data_model/models/property'
require 'core_data_model/models/fetch_request'

module CoreDataModel
  class FetchedProperty < Property
    element :fetchRequest, as: :fetch_request, class: FetchRequest

    def type
      user_defined_type || fetch_request.entity.class_name
    end
  end
end
