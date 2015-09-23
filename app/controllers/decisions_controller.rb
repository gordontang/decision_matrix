class DecisionsController < ApplicationController

	def show
		@decision = Decision.find(params[:id])
		@alternatives = @decision.alternatives.paginate(page: params[:page])
	end

	def new
		@decision = Decision.new
	end

	def create
	  @decision = Decision.new(decision_params)
	  if @decision.save
	    flash[:success] = "Successfully created decision."
	    redirect_to @decision
	  else
	    render 'new'
	  end
	end

	def update
		@decision = Decision.find(params[:id])
		if @decision.update(params[:decision])
			redirect_to @decision
		else
			render 'edit'
		end
	end


 private

  def decision_params
      params.require(:decision).permit(:name)
  end

  # def set_decision
  # 	@decision = Decision.find(params[:id])
  # end

end