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
    @alternative_1 = @decision.alternatives.create!(name: "toaster")
    @goal_1 = @decision.goals.create!(name: "fast")
    @score_1 = Score.new(alternative_id: @alternative_1.id,
                         goal_id: @goal_1.id,
                         decision_id: @decision.id,
                         rating: 0)
    @score_1.save
    # @score_1 = @goal_1.scores.build(
    #                 params[:score].merge(:alternative_id => @alternative_1.id,
    #                                      :decision_id => @goal_1.decision_id))
    assert_difference ['Alternative.count','Goal.count'], -1 do
        @decision.destroy
    end
  end
end
