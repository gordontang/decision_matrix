require 'test_helper'

class AlternativesControllerTest < ActionController::TestCase

  def setup
  	@alternative = alternatives(:toaster)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
