require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  def setup
  	@decision = Decision.new(name: "Sample decision")
  end

  test "should be valid" do
  	assert @decision.valid?
  end

  test "name should be present" do
  	@decision.name = "   "
  	assert_not @decision.valid?
  end

  test "name should not be too long" do
    @decision.name = "a" * 51
    assert_not @decision.valid?
  end

  test "associated decision data should be destroyed" do
  	@decision.save
  	@decision.alternatives.create!(name: "sample")
  	assert_difference 'Alternative.count', -1 do
  		@decision.destroy
  	end
  end
end
