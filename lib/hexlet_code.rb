# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HTML-forms generation helper.
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRenderer, 'hexlet_code/form_renderer.rb')
  autoload(:Inputs, 'hexlet_code/inputs')

  def self.form_for(entity, **options)
    builded_forms = FormBuilder.new(entity)
    yield(builded_forms) if block_given?
    FormRenderer.render_html(builded_forms, **options)
  end
end
