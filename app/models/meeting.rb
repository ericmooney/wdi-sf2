class Meeting < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor
  attr_accessible :day, :week, :instructor_id, :student_id

  def day_name
    names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    names[day-1]
  end

  def cached_instructor_name
    Rails.cache.fetch([self, "instructor_name"]) {instructor.to_a}
  end

  def cached_student_name
    Rails.cache.fetch([self, "student_name"]) {student.to_a}
  end

  def self.cached_meeting_eagerly
    Rails.cache.fetch([self, "meetings"]) {self.includes(:student, :instructor).select("meetings.*, students.name as student_name, instructors.name as instructor_name").all}
  end


end
