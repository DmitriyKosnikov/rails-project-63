# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    # Input rendering.
    class StringInput < BaseInput
      TAG = 'input'

      def render
        render_label + Tag.build(TAG, name: name, type: 'text', value: value, **options)
      end
    end
  end
end
