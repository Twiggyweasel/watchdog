class EvetypesController < ApplicationController
  
  def index
    @evetypes = Evetype.all 
  end
  
  def new
     @evetype = Evetype.new
  end
  
  def create
    @evetype = Evetype.new(evetype_params)
    
    if @evetype.save
      flash[:success] = "Evetype has been created successfully!"
      redirect_to evetypes_path
    else
      render 'new'
    end
  end
  
  def edit
     @evetype = Evetype.find(params[:id])
  end
  
  def update
    @evetype = Evetype.find(params[:id])
    
    if @evetype.update(Evetype_params)
      flash[:success] = "Evetype has been updated successfully!"
      redirect_to evetypes_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @evetype = Evetype.find(params[:id])
      @evetype.destroy
      redirect_to evetypes_path
  end
  
  private
    def evetype_params
      params.require(:evetype).permit(:name)
    end

end