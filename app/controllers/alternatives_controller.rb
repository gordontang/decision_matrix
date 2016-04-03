class AlternativesController < ApplicationController

  def new
  	@alternative = Alternative.new
  end

  def create
  	@alternative = Alternative.new(alternative_params) #@alternative = current_decision.alternatives.build(alternative_params)
  	@alternative.decision_id = current_decision.id
    if @alternative.save
      log_in Decision.find(current_decision.id)
      flash[:success] = "Success! Added an alternative."
      redirect_to Decision.find(current_decision.id)
    else
      render 'new'
    end
  end

  def edit
    @alternative = Alternative.find(params[:id])
  end

  def update
    @alternative = Alternative.find(params[:id])
    if @alternative.update_attributes(alternative_params)
      flash[:success] = "Alternative updated"
      redirect_to Decision.find(current_decision.id)
    else
      render 'edit'
    end
  end

  def destroy
    @alternative = Alternative.find(params[:id])
    @alternative.destroy
    flash[:success] = "Alternative deleted"
    redirect_to Decision.find(current_decision.id)
  end


 private

  def alternative_params
      params.require(:alternative).permit(:name, :decision_id)
  end
end
