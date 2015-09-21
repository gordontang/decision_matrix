module FormHelper
  def setup_decision(decision)
    decision.alternatives ||= Alternative.new
    3.times { decision.alternatives.build }
    decision
  end
end