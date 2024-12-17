# frozen_string_literal: true

require_relative 'test_helper'
require 'minitest/autorun'

User = Struct.new(:name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def setup
    @user = User.new(name: "rob", job: "hexlet")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_generates_empty_form
    result = HexletCode.form_for(@user)
    expected_value = '<form action="#" method="post"></form>'
    assert_equal expected_value, result
  end

  def test_form_for_with_options
    result = HexletCode.form_for(@user, class: "hexlet-form")
    expected_value = '<form action="#" method="post" class="hexlet-form"></form>'
    assert_equal expected_value, result
  end

  def test_form_with_single_input
    result = HexletCode.form_for(@user) do |f|
      f.input :name
    end
    expected = '<form action="#" method="post"><input name="name" type="text" value="rob"></form>'
    assert_equal expected, result
  end

  def test_form_with_textarea
    result = HexletCode.form_for(@user) do |f|
      f.input :job, as: :text
    end
    expected = '<form action="#" method="post"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>'
    assert_equal expected, result
  end

  def test_form_with_custom_attributes
    result = HexletCode.form_for(@user) do |f|
      f.input :name, class: "custom-class"
    end
    expected = load_fixture("form_with_custom_attributes.html")
    assert_equal expected, result
  end

  def test_form_with_overridden_textarea_attributes
    result = HexletCode.form_for(@user) do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expected = load_fixture("form_with_overridden_textarea_attributes.html")
    assert_equal expected, result
  end

  def test_form_with_multiple_inputs
    result = HexletCode.form_for(@user) do |f|
      f.input :name
      f.input :job, as: :text
    end
    expected = load_fixture("form_with_multiple_inputs.html")
    assert_equal expected, result
  end
end
