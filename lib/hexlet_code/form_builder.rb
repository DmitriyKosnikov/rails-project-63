# frozen_string_literal: true

require_relative 'inputs/string_input'
require_relative 'inputs/text_input'

module HexletCode
  # Builder for all forms.
  class FormBuilder
    attr_accessor :entity, :inputs, :submit_options

    def initialize(entity)
      @entity = entity
      @inputs = []
      @submit_options = {}
    end

    def input(field_name, **options)
      value = @entity.public_send(field_name)

      @inputs << if options.delete(:as) == :text
                   Inputs::TextInput.new(field_name, value, **options)
                 else
                   Inputs::StringInput.new(field_name, value, **options)
                 end
    end

    def submit(value = 'Save')
      @submit_options = { type: 'submit', value: value }
    end
  end
end
