class CourtDay < ActiveRecord::Base
  def dow
    court_date.strftime("%A")
  end
end
