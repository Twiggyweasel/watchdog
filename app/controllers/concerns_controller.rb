class ConcernsController < ApplicationController
  
  def index
    @concerns = Concern.all 
  end
  
  def new
     @concern = Concern.new
  end
  
  def create
    @concern = Concern.new(concern_params)
    
    if @concern.save
      flash[:success] = "Concern has been created successfully!"
      redirect_to concerns_path
    else
      render 'new'
    end
  end
  
  def edit
     @concern = Concern.find(params[:id])
  end
  
  def update
    @concern = Concern.find(params[:id])
    
    if @concern.update(Concern_params)
      flash[:success] = "Concern has been updated successfully!"
      redirect_to concerns_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @concern = Concern.find(params[:id])
      @concern.destroy
      redirect_to concerns_path
  end
  
  private
    def concern_params
      params.require(:concern).permit(:concern_name, :concern_description, :date_of_start, :archived, :contypes)
    end

end