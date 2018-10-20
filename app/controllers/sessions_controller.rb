class SessionsController < ApplicationController
  def new
  end
  
  def create
    sign_in_as email_param
    redirect_to root_path
  end

  private

  def email_param
    params.require(:session).require(:email)
  end
end
