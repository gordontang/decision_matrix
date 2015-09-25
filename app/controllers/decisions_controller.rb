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
	  	log_in @decision
	    flash[:success] = "Successfully created decision."
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


 private

  def decision_params
      params.require(:decision).permit(:name)
  end

  # def set_decision
  # 	@decision = Decision.find(params[:id])
  # end

end