require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid with username, password and email" do
    user = User.new(:user_name => 'bob', :password => 'bobber', :encrypted_password => 'askdh',  :email => 'bob.bob.bob')
    assert user.valid?
  end
  #
  # test "user is invalid without username" do
  #   user = User.new(:password => 'bobber', :email => 'bob.bob.bob')
  #   assert user.valid?
  # end
  #
  # test "user is invalid without password" do
  #   user = User.new(:user_name => 'bob', :email => 'bob.bob.bob')
  #   assert user.valid?
  # end
  #
  # test "user is invalid without email" do
  #   user = User.new(:user_name => 'bob', :password => 'bobber')
  #   assert user.valid?
  # end
end
