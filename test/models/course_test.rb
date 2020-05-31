require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'should throw an exception when trying to save a course with an existant code' do
    course = Course.new(code: "COMP 303", name: "Different Name")
    refute course.valid?
    refute course.save
  end
end
