class ConstructionsController < ApplicationController
  
  def index
    @constructions = Construction.all 
  end
  
  def new
     @construction = Construction.new
  end
  
  def create
    @construction = Construction.new(construction_params)
    
    if @construction.save
      flash[:success] = "Construction has been created successfully!"
      redirect_to constructions_path
    else
      render 'new'
    end
  end
  
  def edit
     @construction = Construction.find(params[:id])
  end
  
  def update
    @construction = Construction.find(params[:id])
    
    if @construction.update(Construction_params)
      flash[:success] = "Construction has been updated successfully!"
      redirect_to constructions_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @construction = Construction.find(params[:id])
      @construction.destroy
      redirect_to constructions_path
  end
  
  private
    def construction_params
      params.require(:construction).permit(:location, :construction_type, :date_of_completion, :construction_details, :date_of_start, :archived)
    end

end