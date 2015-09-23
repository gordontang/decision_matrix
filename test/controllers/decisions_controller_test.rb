require 'test_helper'

class DecisionsControllerTest < ActionController::TestCase

  def setup
  	@decision = Decision.new(name: "oven")
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Start | Decision Matrix"
  end

  test "associated alternatives should be destroyed" do
  	@decision.save
  	@decision.alternatives.create!(name: "alt 1")
  	assert_difference 'Alternative.count', -1 do
  		@decision.destroy
  	end
  end

end
