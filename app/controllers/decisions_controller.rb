class DecisionsController < ApplicationController

	def show
		@decision = Decision.find(params[:id])
	end

  def new
  end
end
