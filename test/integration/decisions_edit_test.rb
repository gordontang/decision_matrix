require 'test_helper'

class DecisionsEditTest < ActionDispatch::IntegrationTest
  def setup
    @decision = decisions(:oven)
  end

  test "unsuccessful edit" do
    get edit_decision_path(@decision)
    assert_template 'decisions/edit'
    patch decision_path(@decision), decision: { name: "" }
    assert_template 'decisions/edit'
  end

  test "successful edit" do
    get edit_decision_path(@decision)
    assert_template 'decisions/edit'
    name  = "Foo Bar"
    patch decision_path(@decision), decision: { name: name }
    assert_not flash.empty?
    assert_redirected_to @decision
    @decision.reload
    assert_equal name,  @decision.name
  end
end
