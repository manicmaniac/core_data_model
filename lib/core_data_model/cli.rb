require 'thor'
require 'core_data_model/generators/entity'

module CoreDataModel
  class CLI < Thor
    desc 'generate MODEL_FILE OUTPUT_DIR', 'generate swift source code'
    method_option 'template_file', desc: 'path to "entity.swift.erb" file'
    def generate(model_file, output_dir)
      Generators::Entity.new(model_file, output_dir, options[:template_file]).generate
    end
  end
end
