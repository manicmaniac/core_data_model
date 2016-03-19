require 'sax-machine'
require 'core_data_model/models/entry'

module CoreDataModel
  class UserInfo
    include SAXMachine

    ancestor :ancestor

    elements :entry, as: :entries, class: Entry

    def [](key)
      to_hash[key]
    end

    def to_hash
      @hash ||= entries.each_with_object({}) do |entry, hash|
        hash[entry.key] = entry.value
      end
    end

    alias to_h to_hash
  end
end
