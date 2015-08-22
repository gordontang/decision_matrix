require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  def setup
    @decision = decisions(:oven)
    @score = @decision.scores.build(decision_id: 1, alternative_id: 2, goal_id: 1)
  end

  test "should be valid" do
    assert @score.valid?
  end

  test "decision id should be present" do
    @score.decision_id = nil
    assert_not @score.valid?
  end

  test "alternative id should be present" do
    @score.alternative_id = nil
    assert_not @score.valid?
  end

  test "goal id should be present" do
    @score.goal_id = nil
    assert_not @score.valid?
  end

  test "rating should be valid within range" do
  	@score.rating = 0
  	assert @score.valid?
  end

  test "rating should not be decimal" do
  	@score.rating = 1.5
  	assert_not @score.valid?
  end

  test "rating should not be < -2" do
  	@score.rating = -3
  	assert_not @score.valid?
  end

  test "rating should not be > +2" do
  	@score.rating = 3
  	assert_not @score.valid?
  end
end
