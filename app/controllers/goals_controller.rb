class GoalsController < ApplicationController
	# Using "Goals" instead of "Criteria" for Rails plural naming conventions

  def new
  	@goal = Goal.new
  end

  def create
  	@goal = Goal.new(goal_params)
  	@goal.decision_id = current_decision.id
    if @goal.save
      log_in Decision.find(current_decision.id)
      flash[:success] = "Success! Added a criteria."
      redirect_to Decision.find(current_decision.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end


 private

  def goal_params
      params.require(:goal).permit(:name, :decision_id)
  end
end
