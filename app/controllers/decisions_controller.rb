class DecisionsController < ApplicationController

	def show
		@decision = Decision.find(params[:id])
		@alternatives = @decision.alternatives.paginate(page: params[:page])
		@goals = @decision.goals.paginate(page: params[:page])
		@scores = @decision.scores.paginate(page: params[:page])
	end

	def new
		@decision = Decision.new
	end

	def create
	  @decision = Decision.new(decision_params)
	  if @decision.save
	  	log_in @decision
	    flash[:success] = "Success! Created a new decision."
	    redirect_to @decision
	  else
	    render 'new'
	  end
	end

	def edit
    @decision = Decision.find(params[:id])
  end

	def update
		@decision = Decision.find(params[:id])
		if @decision.update_attributes(decision_params)
			flash[:success] = "Decision updated"
			redirect_to @decision
		else
			render 'edit'
		end
	end

	def destroy
		@decision = Decision.find(params[:id])
		@decision.destroy
		flash[:success] = "Decision and its dependencies deleted"
		redirect_to root_url
	end

 private

  def decision_params
      params.require(:decision).permit(:name)
  end

  # def set_decision
  # 	@decision = Decision.find(params[:id])
  # end

end