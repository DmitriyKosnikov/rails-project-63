# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    # Textarea rendering.
    class TextInput < BaseInput
      TAG = 'textarea'

      def render
        default_params = { cols: 20, rows: 40 }.merge(options)

        render_label +
          Tag.build(TAG, name: name, **default_params) { value }
      end
    end
  end
end
