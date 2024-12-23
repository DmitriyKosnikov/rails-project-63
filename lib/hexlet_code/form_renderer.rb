# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # Rendering form to HTML(or other languages)
  class FormRenderer
    def self.render_html(form_builder, form_options)
      action = form_options.delete(:url) || '#'
      method = 'post'

      prioritized_options = { action: action, method: method }.merge(form_options)

      Tag.build('form', **prioritized_options) do
        render_inputs(form_builder.inputs) + render_submit_html(**form_builder.submit_options)
      end
    end

    def self.render_inputs(inputs)
      inputs.reduce('') { |acc, input| "#{acc}#{input.render}" }
    end

    def self.render_submit_html(**options)
      options.empty? ? '' : Tag.build('input', **options)
    end
  end
end
