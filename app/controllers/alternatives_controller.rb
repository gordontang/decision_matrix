class AlternativesController < ApplicationController

  def new
  	@alternative = Alternative.new
  	# 3.times do
  	# 	@decision.alternatives.build
  	# end
  end

  def create
  	#@alternative = Decision.new(params[:decision]).alternatives
  	if @decision.update_attributes(params[:decision])
  		redirect_to about_url ### Not final! Change to next input phase
  	else
  		render 'new'
  	end
  end

 private

  def alternative_params
      params.require(:alternative).permit(:name, :decision_id)
  end
end
