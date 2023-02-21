class UsersController < ApplicationController
 
  def index
    @users = User.all
    render :index
  end
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def edit
  end

  def show
    render :show
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
