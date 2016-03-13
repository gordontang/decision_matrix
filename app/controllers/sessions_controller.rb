class SessionsController < ApplicationController
  def new
  end

  def create
    decision = Decision.find_by(id: params[:session][:id])
    if decision
        log_in decision
        #params[:session][:remember_me] == '1' ? remember(decision) : forget(decision)
        redirect_to decision #redirect_back_or decision
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

end
