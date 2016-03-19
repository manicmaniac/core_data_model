require 'sax-machine'

module CoreDataModel
  class Entry
    include SAXMachine

    ancestor :user_info

    attribute :key
    attribute :value
  end
end
