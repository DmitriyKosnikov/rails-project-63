# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    # Textarea rendering.
    class TextInput < BaseInput
      TAG = 'textarea'
      COLS = 20
      ROWS = 40

      def render
        default_params = { cols: COLS, rows: ROWS }.merge(options)

        render_label +
          Tag.build(TAG, name: name, **default_params) { value }
      end
    end
  end
end
