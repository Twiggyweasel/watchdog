class LoginsController < ApplicationController
  
  def new
    @users = User.all
  end
  
  def create
    @users = User.all
    user = User.find(params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_name] = user.user_name
      flash[:success] = "You are now logged in"
      redirect_to index_path
      
    else
      flash.now[:danger] = "Your input was invalid"
      render 'new'
    end
  end
  
  def destroy
    session[:user_name] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end