# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # Класс для генерации полей внутри объекта.
  class FormGenetator
    attr_reader :user, :forms

    def initialize(user)
      @user = user
      @forms = []
    end

    def input(field_name, **options) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      value = user.public_send(field_name)

      default_attributes = { name: field_name }

      @forms << Tag.build('label', for: field_name.to_s) { field_name.to_s.capitalize }

      case options[:as]
      when :text
        options.delete(:as)
        default_textarea_attributes = { cols: 20, rows: 40 }
        @forms << Tag.build('textarea', **default_attributes.merge(default_textarea_attributes).merge(options)) do
          value
        end
      else
        default_input_attributes = { type: 'text', value: value }
        @forms << Tag.build('input', **default_attributes.merge(default_input_attributes).merge(options))
      end
    end

    def submit(value = 'Save')
      @forms << Tag.build('input', type: 'submit', value: value)
    end

    def render_forms
      @forms.join('')
    end
  end
end
