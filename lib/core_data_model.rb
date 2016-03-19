require 'core_data_model/version'
require 'core_data_model/core_data_model_d'

module CoreDataModel
  module_function

  def parse(path)
    CoreDataModelD.new(path)
  end
end
