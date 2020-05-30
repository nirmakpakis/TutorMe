class Receiving < ApplicationRecord
  belongs_to :studentCourse, :class_name => "Course", foreign_key: :course_id
  belongs_to :user
end
