require 'core_data_model/models/property'

module CoreDataModel
  class Attribute < Property
    attribute :attributeType, as: :attribute_type
    attribute :allowsExternalBinaryDataStorage,
              as: :allows_external_binary_data_storage,
              default: false,
              &:to_b
    attribute :minValueString, as: :min_value_string
    attribute :maxValueString, as: :max_value_string
    attribute :defaultValueString, as: :default_value_string
    attribute :regularExpressionString, as: :regular_expression_string
    attribute :minDateTimeInterval, as: :min_date_time_interval, class: Float
    attribute :maxDateTimeInterval, as: :max_date_time_interval, class: Float
    attribute :defaultDateTimeInterval,
              as: :default_date_time_interval,
              class: Float

    alias allows_external_binary_data_storage? \
          allows_external_binary_data_storage

    SWIFT_TYPE = {
      'Binary' => 'NSData',
      'Boolean' => 'Bool',
      'Date' => 'NSDate',
      'Decimal' => 'NSDecimal',
      'Float' => 'Float',
      'Double' => 'Double',
      'Integer 16' => 'Int16',
      'Integer 32' => 'Int32',
      'Integer 64' => 'Int64',
      'String' => 'String',
      'Transformable' => 'AnyObject'
    }.freeze

    def type(with_optional: true)
      (user_defined_type || SWIFT_TYPE[attribute_type]) +
        ('?' if with_optional && optional?)
    end

    def min_value
      min_date_time_interval || convert_type(min_value_string)
    end

    def max_value
      max_date_time_interval || convert_type(max_value_string)
    end

    def default_value
      default_date_time_interval || convert_type(default_value_string)
    end

    def regular_expression
      Regexp.new(regular_expression_string)
    end

    private

    def convert_type(string)
      case attribute_type
      when 'Boolean'
        string.to_b
      when 'Float', 'Double'
        string.to_f
      when 'Decimal', 'Integer 16', 'Integer 32', 'Integer 64'
        string.to_i
      else
        string
      end
    end
  end
end
