class SessionsController < ApplicationController
  def new
  end
  
  def create
    session[:current_email] = email_param
    redirect_to root_path
  end

  private

  def email_param
    params.require(:session).permit(:email)
  end
end
