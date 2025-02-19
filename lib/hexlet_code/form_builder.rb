# frozen_string_literal: true

module HexletCode
  # Builder for all forms.
  class FormBuilder
    attr_accessor :entity, :form_body

    def initialize(entity, options)
      @entity = entity
      action = options.fetch(:action, '#')
      method = options.fetch(:method, 'post').to_s
      @form_body = {
        inputs: [],
        submit: {},
        form_options: { action: action, method: method }.merge(options.except(:url, :method))
      }
    end

    def input(field_name, **options)
      value = @entity.public_send(field_name)

      class_name = "#{options.fetch(:as, :string).to_s.capitalize}Input"

      input_class = Inputs.const_get(class_name)

      filtered_options = options.reject { |key, _| key == :as }

      @form_body[:inputs] << input_class.new(field_name, value, **filtered_options)
    end

    def submit(value = 'Save')
      @form_body[:submit] = { type: 'submit', value: value }
    end
  end
end
