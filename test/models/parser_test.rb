require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  test "parse from string" do
    text = "THURSDAY, January 15, 2015 jurors with summonses numbered 6000 through and including 7200 are to report for jury service."
    result = Parser.from_string(text)
    assert_equal text, result.text
    assert_equal 1200, result.count
    assert_equal "2015-01-15", result.date.strftime("%Y-%m-%d")
  end

  test "parse from html" do
    stub_request(:get, Parser::JUROR_SELECT_URL).to_return(body: File.open('test/fixtures/juror-select.html'), status: 200)
    text =   "<!--startv001-->WEDNESDAY, January 28, 2015 jurors with summonses numbered 4000 through and including 5200 are to report for jury service.<P><!--NoHTML--><!--endv001-->"
    result = Parser.from_web
    assert_equal text, result.text
  end
end
