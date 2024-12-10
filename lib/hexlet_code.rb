# frozen_string_literal: true

require_relative "hexlet_code/version"

# HTML-forms generation helper.
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  autoload(:Tag, "hexlet_code/tag.rb")

  def self.form_for(entity, **options)
    action = options.delete(:url) || "#"
    method = "post"

    prioritized_options = { action: action, method: method }

    Tag.build("form", **prioritized_options.merge(options)) { yield if block_given? }
  end
end
