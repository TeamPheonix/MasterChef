require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.new(:email => "admin@a.a", :user_name => "tagAdmin", :password => "tagAdmin", :privileges => 1)
    post users_url, params: { user: { :email => @user1.email, password: @user1.password, privileges: @user1.privileges, user_name: @user1.user_name} }
    login(@user1.user_name,@user1.password)

    @tag = Tag.new(:approved => true, :tag_name => "testTag")
    post tags_url, params: { tag: { approved: @tag.approved, tag_name: @tag.tag_name } }
    @tag = Tag.where(tag_name: "testTag").first
  end

  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      @newTag = Tag.new(approved: true, tag_name: "randomTagName")
      post tags_url, params: { tag: { approved: @newTag.approved, tag_name: @newTag.tag_name } }
    end
    assert_redirected_to tag_url(Tag.last)
  end

  test "should show tag" do
    get tag_url(@tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    patch tag_url(@tag), params: { tag: { approved: true, tag_name: "updatedTagName" } }
    assert_response :success
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end
    assert_redirected_to tags_url
  end

  def login(user_name, password)
    # perform the actual login
    post sessions_attempt_login_path(:username => user_name, :password => password)
    assert_redirected_to root_path
    # check the users's values in the session
    assert_not_nil session[:user_id]
    assert_equal session[:user_id], (User.where(user_name: user_name).first).id
  end
end
