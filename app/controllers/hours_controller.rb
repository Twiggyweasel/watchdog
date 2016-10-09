class HoursController < ApplicationController
  
  def index
    @hours = Hour.all 
  end
  
  def new
    @hour = Hour.new
  end
  
  def create
    @hour = Hour.new(hour_params)
    
    if @hour.save
      flash[:success] = "Hour has been created successfully!"
      redirect_to reference_admin_path
    else
      render 'new'
    end
  end
  
  def edit
     @hour = Hour.find(params[:id])
  end
  
  def update
    @hour = Hour.find(params[:id])
    
    if @hour.update(hour_params)
      flash[:success] = "Hour has been updated successfully!"
      redirect_to reference_admin_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @hour = Hour.find(params[:id])
      @hour.destroy
      redirect_to reference_admin_path
  end
  
  private
    def hour_params
      params.require(:hour).permit(:restaurant_name, :hour_set_one, :hour_set_two, :hour_set_three, :hour_set_four, :hour_set_five, :restaurant_details, :restaurant_promotions)
    end

end