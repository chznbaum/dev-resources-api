require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should have name' do
    refute users(:no_name).valid?
  end

  test 'should have email' do
    refute users(:no_email).valid?
  end

  test 'should have unique email' do
    user1 = users(:valid_user)
    user2 = User.new(name: 'Duplicate User', email: users(:valid_user).email)
    refute user2.save, 'Saved a user with the same email'
  end
end
