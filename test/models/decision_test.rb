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
end
