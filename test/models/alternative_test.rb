require 'test_helper'

class AlternativeTest < ActiveSupport::TestCase
  def setup
  	@decision = decisions(:oven)
  	@alternative = @decision.alternatives.build(name: 'microwave')
	end

	test "should be valid" do
		assert @alternative.valid?
	end

	test "decision id should be present" do
		@alternative.decision_id = nil
		assert_not @alternative.valid?
	end

	test "name should be present" do
  	@alternative.name = "   "
  	assert_not @alternative.valid?
  end

  test "name should not be too long" do
    @alternative.name = "a" * 51
    assert_not @alternative.valid?
  end
end
