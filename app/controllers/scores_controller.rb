class ScoresController < ApplicationController

  def new
  	@score = Score.new
  end

  def create
  	@score = Score.new(score_params)
  	@score.decision_id = current_decision.id
  	# @score.alternative_id = current_alternative.id # entered in form
  	# @score.goal_id = current_goal.id # entered in form
    if @score.save
      log_in Decision.find(current_decision.id)
      flash[:success] = "Success! Added a score."
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

  def score_params
      params.require(:score).permit(:value, :decision_id, :goal_id, :alternative_id)
  end

end
