# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # Rendering form to HTML(or other languages)
  class FormRenderer
    def self.render_html(form_builder)
      form_body = form_builder.form_body

      Tag.build('form', **form_body[:form_options]) do
        render_inputs(form_body[:inputs]) + render_submit_html(**form_body[:submit])
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
