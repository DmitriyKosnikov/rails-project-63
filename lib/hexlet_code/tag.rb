# frozen_string_literal: true

module HexletCode
  # Responsible for html-tags
  module Tag
    SINGLE_TAGS = %w[br input img link meta].freeze

    def self.build(name, **options)
      additions = options.empty? ? "" : make_params(options)

      block_val = block_given? ? yield : ""

      SINGLE_TAGS.include?(name) ? "<#{name}#{additions}>" : "<#{name}#{additions}>#{block_val}</#{name}>"
    end

    private

    def make_params(options)
      result = ""

      options.map do |key, value|
        result = "#{result} #{key}=\"#{value}\""
      end

      result
    end
  end
end
