class DepartmentsController < ApplicationController
  
  def index
    @departments = Department.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
     @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)
    
    if @department.save
      flash[:success] = "Department has been created successfully!"
      redirect_to departments_path
    else
      render 'new'
    end
  end
  
  def edit
     @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    
    if @department.update(department_params)
      flash[:success] = "Department has been updated successfully!"
      redirect_to departments_path 
    else
      render 'edit'
    end
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end
  
  private
    def department_params
       params.require(:department).permit(:name)
    end

end