class CourtDaysController < ApplicationController
  def index
    @court_days = CourtDay.all
    respond_to do |format|
      format.html
      format.json { render json: @court_days }
    end
  end
end
