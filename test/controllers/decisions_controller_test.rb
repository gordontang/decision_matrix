require 'test_helper'

class DecisionsControllerTest < ActionController::TestCase

  def setup
  	@decision = decisions(:oven)
    @other_decision = decisions(:phone)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Start | Decision Matrix"
  end

  test "should destroy Decision and related objects" do
    @decision.save
    assert_response :success
    assert_difference 'Decision.count', -1 do
      assert_difference 'Alternative.count', -@decision.alternatives.count do
        @decision.destroy
      end
    end
  end

  # test "should redirect index when not logged in" do
  #   get :index
  #   assert_redirected_to login_url
  # end

end
