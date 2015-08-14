require 'test_helper'

class DecisionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Start | Decision Matrix"
  end

end
