class Teaching < ApplicationRecord
  belongs_to :tutorCourse, :class_name => "Course", foreign_key: :course_id
  belongs_to :user
end
