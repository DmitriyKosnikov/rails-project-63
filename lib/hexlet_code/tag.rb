# frozen_string_literal: true

module HexletCode
  # Responsible for html-tags
  module Tag
    SINGLE_TAGS = %w[br input img link meta].freeze

    def self.build(name, **options)
      additions = options.map { |key, value| "#{additions} #{key}=\"#{value}\"" }.join

      block_val = block_given? ? yield : ""

      SINGLE_TAGS.include?(name) ? "<#{name}#{additions}>" : "<#{name}#{additions}>#{block_val}</#{name}>"
    end
  end
end
