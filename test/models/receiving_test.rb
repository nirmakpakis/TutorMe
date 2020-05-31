require 'test_helper'

class ReceivingTest < ActiveSupport::TestCase
  test 'should return true' do
    assert true
  end

  test 'should not be able to create a receiving without a user' do
    receiving = Receiving.new(course_id: "1")
    refute receiving.valid?
  end

  test 'should not be able to create a receiving without a course' do
    receiving = Receiving.new(user_id: "1")
    refute receiving.valid?
  end

  test 'should fail if user does not exsits' do
    receiving = Receiving.new(user_id: "44", course_id: "1")
    refute receiving.valid?
  end

  test 'should fail if course does not exsits' do
    receiving = Receiving.new(user_id: "1", course_id: "44")
    refute receiving.valid?
  end

  test 'should pass if we are trying to link a valid user to a valid course' do
    receiving = Receiving.new(user_id: "1", course_id: "3")
    assert receiving.valid?
  end
end