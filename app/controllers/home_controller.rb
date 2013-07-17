class HomeController < ApplicationController
  def index
    @weeks = [5, 6, 7, 8, 9, 10, 11]
    @days = [1, 2, 3, 4, 5]
    @meetings = Meeting.cached_meeting_eagerly
  end
end
