class TipsController < ApplicationController
  
  def index
    @tips = Tip.all 
  end
  
  def new
     @tip = Tip.new
  end
  
  def create
    @tip = Tip.new(tip_params)
    
    if @tip.save
      flash[:success] = "Tip has been created successfully!"
      redirect_to tips_path
    else
      render 'new'
    end
  end
  
  def edit
     @tip = Tip.find(params[:id])
  end
  
  def update
    @tip = Tip.find(params[:id])
    
    if @tip.update(tip_params)
      flash[:success] = "Tip has been updated successfully!"
      redirect_to tips_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @tip = Tip.find(params[:id])
      @tip.destroy
      redirect_to tips_path
  end
  
  private
    def tip_params
      params.require(:tip).permit(:totd, :archived)
    end

end