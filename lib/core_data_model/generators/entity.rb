require 'erb'
require 'pathname'
require 'rubygems'
require 'core_data_model/core_data_model_d'

module CoreDataModel
  module Generators
    class Entity
      attr_reader :model, :output_path, :template

      def initialize(model_path, output_dir, template_path = nil)
        template_path ||= default_template_path
        @model = CoreDataModelD.new(model_path).model
        @output_path = Pathname.new(output_dir)
        safe_level = nil
        trim_mode = '-'
        @template = ERB.new(File.read(template_path), safe_level, trim_mode)
      end

      def generate
        @model.entities.each do |entity|
          generate_for_entity(entity)
        end
      end

      private

      def generate_for_entity(entity)
        require 'active_support/all'
        output_file_path = @output_path.join("#{entity.class_name}.swift")
        code = @template.result(binding)
        output_file_path.write(code)
        puts("Generated: #{output_file_path}")
      end

      def default_template_path
        data_path = Pathname.new(Gem.datadir('core_data_model'))
        data_path.join('entity.swift.erb').to_s
      end
    end
  end
end
