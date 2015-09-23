class AlternativesController < ApplicationController

  def new
  	@alternative = Alternative.new
  end

  def create

  	@alternative = Alternative.new(alternative_params) #@alternative = current_decision.alternatives.build(alternative_params)
  	if @decision.update_attributes(params[:decision])
  		flash[:success] = "Alternative added!"
  		redirect_to about_url ### Not final! Change to next input phase
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def destroy
  end


 private

  def alternative_params
      params.require(:alternative).permit(:name, :decision_id)
  end
end
