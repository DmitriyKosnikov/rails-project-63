# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HTML-forms generation helper.
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormGenetator, 'hexlet_code/form_generator')

  def self.form_for(user, **options)
    action = options.delete(:url) || '#'
    method = 'post'

    prioritized_options = { action: action, method: method }

    Tag.build('form', **prioritized_options.merge(options)) do
      form_builder = HexletCode::FormGenetator.new(user)
      yield(form_builder) if block_given?
      form_builder.render_forms
    end
  end
end
