require 'test_helper'

class DecisionsLoginTest < ActionDispatch::IntegrationTest

	def setup
    @decision = decisions(:oven)
  end

  test "login with invalid information" do
  	get login_path
  	assert_template 'sessions/new'
    post login_path, session: { name: "" }
    assert_template 'sessions/new'
    assert_not flash.empty? # check that flash works first time
    get root_path
		assert flash.empty? # ensure that flash doesn't repeat
  end

  test "login with valid information followed by logout" do
  	## decision profile appears after successful login
  	get login_path
    post login_path, session: { name: @decision.name }
    assert is_logged_in?
    assert_redirected_to @decision
    follow_redirect!
    assert_template 'decisions/show'
  	## "logged in" navigation contains logged in links
  	assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", decision_path(@decision)
    ## test logout
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    ## Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, 	 	 count: 0
    assert_select "a[href=?]", decision_path(@decision), count: 0
  end
end
