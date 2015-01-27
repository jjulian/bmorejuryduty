require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  test "parse from string" do
    text = "THURSDAY, January 15, 2015 jurors with summonses numbered 6000 through and including 7200 are to report for jury service."
    result = Parser.from_string(text)
    assert_equal text, result.text
    assert_equal 1200, result.count
    assert_equal "2015-01-15", result.date.strftime("%Y-%m-%d")
  end
end
