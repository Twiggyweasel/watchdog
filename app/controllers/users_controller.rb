class UsersController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
   
   def index
        @filterrific = initialize_filterrific(
            User,
            params[:filterrific],
            select_options: {
            sorted_by: User.options_for_sorted_by,
            with_deptartment_id: Department.options_for_select,
            with_clearance_id: Clearance.options_for_select
            }
        ) or return
        @userss = @filterrific.find.page(params[:page])
        #@users = User.paginate(page: params[:page], per_page: 5)
        
        respond_to do |format|
            format.html
            format.js
        end
   end   
   
   def show
        @user = User.find(params[:id])
   end
   
   def new
       @user = User.new
       @clearance = Clearance.all
   end
   
   def create
         @user = User.new(user_params)
    if @user.save
      #do something
      #flash[:success] = "Your account has been created successfully!"
      redirect_to users_path
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
      redirect_to users_path
   end
   
   private 
    def user_params
      params.require(:user).permit(:employee_num, :last_name, :first_name, :password, :clearance_id, :department_id)
    end
end