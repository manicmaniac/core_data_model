require 'sax-machine'

module CoreDataModel
  class Configuration
    include SAXMachine

    ancestor :model

    attribute :name
  end
end
