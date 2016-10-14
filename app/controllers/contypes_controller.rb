class ContypesController < ApplicationController
  
  def index
    @contypes = Contype.all 
  end
  
  def new
     @contype = Contype.new
  end
  
  def create
    @contype = Contype.new(contype_params)
    
    if @contype.save
      flash[:success] = "Contype has been created successfully!"
      redirect_to contypes_path
    else
      render 'new'
    end
  end
  
  def edit
     @contype = Contype.find(params[:id])
  end
  
  def update
    @contype = Contype.find(params[:id])
    
    if @contype.update(Contype_params)
      flash[:success] = "Contype has been updated successfully!"
      redirect_to contypes_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @contype = Contype.find(params[:id])
      @contype.destroy
      redirect_to contypes_path
  end
  
  private
    def contype_params
      params.require(:contype).permit(:name)
    end

end