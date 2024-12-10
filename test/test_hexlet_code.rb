# frozen_string_literal: true

require "test_helper"

User = Struct.new("User", :name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_form_for_only_user
    expected_value = "# <form action=\"#\" method=\"post\"></form>"

    user = User.new

    formed = HexletCode.form_for user do |f|
    end

    assert(formed, expected_value)
  end

  def test_form_for_with_options
    expected_value = "<form action=\"#\" method=\"post\" class=\"hexlet-form\"></form>"

    user = User.new

    formed = HexletCode.form_for user, class: "hexlet-form" do |f|
    end

    assert(formed, expected_value)
  end

  def test_form_for_with_block
    user = User.new

    result = HexletCode.form_for(user) { "Inner Content" }
    expected = '<form action="#" method="post">Inner Content</form>'
    assert_equal expected, result, "Form should include content from the block"
  end
end
