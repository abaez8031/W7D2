class SessionsController < ApplicationController
  
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login!(user)
    else
      flash[:errors] = user.errors.full_messages
      render :new
  end


  def destroy
    logout!
    redirect_to new_session_url
  end


end
