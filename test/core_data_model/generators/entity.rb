require 'test_helper'

module GeneratorsTest
  class EntityTest < Minitest::Test
    def setup
      model_path = FIXTURES_PATH + '/model.xcdatamodeld'
      @tmpdir = Dir.mktmpdir
      generator = CoreDataModel::Generators::Entity.new(model_path, @tmpdir)
      generator.generate
    end

    def teardown
      FileUtils.remove_dir(@tmpdir)
    end

    def test_output_directory_contains_swift_files_for_all_entity
      ['AbstractEntity.swift', 'AllTypesOfAttributes.swift',
       'ConcreteEntity.swift', 'FetchedProperties.swift',
       'NewInVersion2.swift', 'RelationshipFrom.swift', 'RelationshipTo.swift',
       'UserInfo.swift'].each do |basename|
         assert File.readable? File.join(@tempdir, basename)
       end
    end
  end
end
