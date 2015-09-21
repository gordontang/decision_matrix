require 'test_helper'

class DecisionsProfileTest < ActionDispatch::IntegrationTest

  include ApplicationHelper

  def setup
    @decision = decisions(:oven)
  end

  test "decision profile display" do
    get decision_path(@decision)
    assert_template 'decisions/show'
    assert_select 'title', full_title(@decision.name)
    assert_select 'h1', text: @decision.name
    assert_match @decision.alternatives.count.to_s, response.body
    assert_select 'div.pagination'
    @decision.alternatives.paginate(page: 1).each do |alternative|
      assert_match alternative.name, response.body
    end
  end
end
