class LoginsController < ApplicationController
  
  
  def new
    if logged_in? 
      redirect_to index_path
    else
      
    @users = User.all
    @boardingUser = User.find(1)
  end
  end
  
  def create
    @users = User.all
    @boardingUser = User.find(1)
    user = User.find_by(employee_num: params[:employee_num])
    if user && user.authenticate(params[:password])
      session[:user] = user.employee_num
      flash[:success] = "Welcome back, " + current_user.first_name + " " + current_user.last_name
      redirect_to index_path
      
    else
      flash.now[:danger] = "Your input was invalid"
      render 'new'
    end
  end
  
  def destroy
    session[:user] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end