class UsersController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
   
   def index
        @users = User.all
   end
   
   def show
        @user = User.find(params[:user_name])
   end
   
   def new
       @user = User.new
   end
   
   def create
         @user = User.new(user_params)
    if @user.save
      #do something
      #flash[:success] = "Your account has been created successfully!"
      redirect_to user_admin_path
    else
      render 'new'
    end
   end
   
   def edit 
       @user = User.find(params[:id])
   end
   
   def update
        @user = User.find(params[:id])
    
    if @user.update(user_params)
      #do
      #flash[:success] = "Your profile has been updated successfully!"
      redirect_to users_path 
    else
      render 'edit'
    end
   end
   
   def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to user_admin_path
   end
   
   private 
    def user_params
      params.require(:user).permit(:user_name, :access, :password)
    end
end