# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # Класс для генерации полей внутри объекта.
  class FormGenetator
    attr_reader :user, :forms, :default_attributes

    def initialize(user)
      @user = user
      @forms = []
      @default_attributes = {}
    end

    def submit(value = 'Save')
      @forms << Tag.build('input', type: 'submit', value: value)
    end

    def input(field_name, **options)
      value = user.public_send(field_name)

      @default_attributes[:name] = field_name

      @forms << Tag.build('label', for: field_name.to_s) { field_name.to_s.capitalize }

      options[:as] == :text ? render_textarea(options, value) : render_input(options, value)
    end

    def render_textarea(options, value)
      options.delete(:as)
      default_textarea_attributes = { cols: 20, rows: 40 }
      attributes = @default_attributes.merge(default_textarea_attributes).merge(options)
      @forms << Tag.build('textarea', **attributes) do
        value
      end
    end

    def render_input(options, value)
      default_input_attributes = { type: 'text', value: value }
      attributes = @default_attributes.merge(default_input_attributes).merge(options)
      @forms << Tag.build('input', **attributes)
    end

    def render_forms
      @forms.join
    end
  end
end
