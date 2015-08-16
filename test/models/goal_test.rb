require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  def setup
      @decision = decisions(:oven)
      @goal = @decision.goals.build(name: 'Reliable')
    end

    test "should be valid" do
        assert @goal.valid?
    end

    test "decision id should be present" do
        @goal.decision_id = nil
        assert_not @goal.valid?
    end

    test "name should be present" do
      @goal.name = "   "
      assert_not @goal.valid?
  end

  test "name should not be too long" do
    @goal.name = "a" * 51
    assert_not @goal.valid?
  end

  test "constraint should be present" do
      @goal.constraint = nil
      assert_not @goal.valid?
  end

  # test "constraint should be boolean" do
  #     @goal.constraint = "aaaa"    # causes deprecation warning as string turns to false
  #     assert_not @goal.constraint?
  # end

  test "rank should be integer" do
  	@goal.rank = 1.5
  	assert_not @goal.valid?
  end

  test "rank should be >= 1" do
  	@goal.rank = 0
  	assert_not @goal.valid?
  end

  test "rank >=1 is valid" do
  	@goal.rank = 1
  	assert @goal.valid?
  end

  test "weight should be in range" do
  	@goal.weight = -100
  	assert_not @goal.valid?
  end

  test "weight >=0 is valid" do
  	@goal.weight = 0.1
  	assert @goal.valid?
  end

  test "weight <=1 is valid" do
  	@goal.weight = 1
  	assert @goal.valid?
  end

end
