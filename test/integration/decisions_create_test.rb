require 'test_helper'

class DecisionsCreateTest < ActionDispatch::IntegrationTest

  def setup
  end

  # test "invalid signup information" do
  #   get root_path
  #   assert_no_difference 'Decision.count' do
  #     post decisions_path, decision: { name: " " }
  #   end
  #   assert_template 'decisions/new'
  #   assert_select 'div#error_explanation'
  #   assert_select 'div.field_with_errors'
  # end

  # test "valid signup information" do
  #   get root_path
  #   assert_difference 'Decision.count', 1 do
  #     post_via_redirect decisions_path, decision: { name: "sample" } #follows redirect
  #   end
  #   assert_template 'static_pages/about' ### not final! update with the next input phase
  # end
end
