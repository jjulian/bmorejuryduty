class Parser

  attr_reader :date, :count, :text

  JUROR_SELECT_URL = "http://www.baltocts.sailorsite.net/flypage/juror-select.html"

  # <!--startv001-->THURSDAY, January 15, 2015 jurors with summonses numbered 6000 through and including 7200 are to report for jury service.<P><!--NoHTML--><!--endv001-->
  def self.from_web(url=JUROR_SELECT_URL)
    text = open(url).read
    section = text.match('<!--startv001-->(.*)<!--endv001-->')[0]
    raise "Could not find section in the html" unless section
    self.from_string section
  end

  def self.from_string(text)
    new(text)
  end

  private

  def initialize(text)
    @text = text
    parse!
  end

  def parse!
    logger.debug text
    s = Sanitize.clean(text)
    logger.debug s
    date_str = s.match(/(?:Monday|Tuesday|Wednesday|Thursday|Friday)\,?(.+20\d\d)/i)[0]
    logger.debug date_str
    numbers_str = s.match(/numbered.+(\d{1,4}.+\d{1,4})/i)[0].gsub(/[^\d\s]/,'')
    logger.debug numbers_str
    numbers_arr = numbers_str.split(' ').map(&:to_i)
    logger.debug numbers_arr.inspect
    @count = (numbers_arr.last - numbers_arr.first).abs
    @date = Date.parse(date_str)
  end

  def logger
    Rails.logger
  end
end
