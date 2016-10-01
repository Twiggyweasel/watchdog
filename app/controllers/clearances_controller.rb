class ClearancesController < ApplicationController
  
  def index
    @clearances = Clearance.all 
  end
  
  def new
     @clearance = Clearance.new
  end
  
  def create
    @clearance = Clearance.new(clearance_params)
    
    if @clearance.save
      flash[:success] = "Clearance has been created successfully!"
      redirect_to clearances_path
    else
      render 'new'
    end
  end
  
  def edit
     @clearance = Clearance.find(params[:id])
  end
  
  def update
    @clearance = Clearance.find(params[:id])
    
    if @clearance.update(clearance_params)
      flash[:success] = "Clearance has been updated successfully!"
      redirect_to clearances_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @clearance = Clearance.find(params[:id])
      @clearance.destroy
      redirect_to clearances_path
  end
  
  private
    def clearance_params
      params.require(:clearance).permit(:name)
    end

end