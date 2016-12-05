require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
    user = User.new(:user_name => bob, :password => bobber, :email => bob.bob.bob)
    assert user.valid?
  end
end
