class DecisionsController < ApplicationController

	def show
		@decision = Decision.find(params[:id])
	end

	def new
		@decision = Decision.new
	end

  def create
  	@decision = Decision.new(decision_params)
  	if @decision.save
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end


private

  def decision_params
      params.require(:decision).permit(:name)
  end

end
