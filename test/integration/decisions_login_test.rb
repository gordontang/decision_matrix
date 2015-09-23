require 'test_helper'

class DecisionsLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
  	get login_path
  	assert_template 'sessions/new'
    post login_path, session: { name: "" }
    assert_template 'sessions/new'
    assert_not flash.empty? # check that flash works first time
    get root_path
		assert flash.empty? # ensure that flash doesn't repeat
  end
end
