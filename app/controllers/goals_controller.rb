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
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      flash[:success] = "Goal updated"
      redirect_to Decision.find(current_decision.id)
    else
      render 'edit'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:success] = "Goal deleted"
    redirect_to Decision.find(current_decision.id)
  end


 private

  def goal_params
      params.require(:goal).permit(:name, :decision_id)
  end
end
