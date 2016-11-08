require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
    user = User.new
    assert user.valid?
  end
end
