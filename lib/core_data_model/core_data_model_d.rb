require 'pathname'
require 'plist'
require 'sax-machine'
require 'core_data_model/models/model'

module CoreDataModel
  class CoreDataModelD
    attr_reader :path, :versions, :current_version, :model

    def initialize(path)
      @path = Pathname.new(path)
      @versions = find_versions
      @current_version = parse_current_version || @versions.first
      @model = parse_model
    end

    private

    def parse_current_version
      path = @path.join('.xccurrentversion').to_s
      current_version = Plist.parse_xml(path)['_XCCurrentVerionName']
      return if current_version.nil?
      @path.join(current_version)
    end

    def find_versions
      Pathname.glob(@path.join('*.xcdatamodel/'))
    end

    def parse_model
      Parser.parse(@current_version.join('contents').read).model
    end
  end

  class Parser
    include SAXMachine
    element :model, class: Model
  end
end
