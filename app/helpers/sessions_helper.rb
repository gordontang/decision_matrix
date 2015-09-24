module SessionsHelper

	# Logs into the given decision.
  def log_in(decision)
    session[:decision_id] = decision.id
  end

  # Returns the current logged-in decision (if any).
  def current_decision
    @current_decision ||= Decision.find_by(id: session[:decision_id])
  end

  # Returns true if the decision is logged in, false otherwise.
  def logged_in?
    !current_decision.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:decision_id)
    @current_decision = nil
  end
end
