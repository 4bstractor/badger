require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, identifier: User.first.email, password: "password"

    assert_equal User.first.id, session[:user_id], "Check the user was signed in"
    assert_equal "Logged In!", flash[:notice], "Check for login notice"
    assert_redirected_to root_url
  end

  test "should fail create" do
    post :create

    assert_nil session[:user_id], "Check the user was not signed in"
    assert_equal "Invalid Email Or Password", flash[:notice], "Check for failure notice"
    assert_redirected_to sign_in_url
  end

  test "should get destroy" do
    session[:user_id] = User.first.id
    get :destroy

    assert_nil session[:user_id], "Check the user was signed out"
    assert_equal "Logged Out!", flash[:notice], "Check for logout notice"
    assert_redirected_to root_url
  end
end
