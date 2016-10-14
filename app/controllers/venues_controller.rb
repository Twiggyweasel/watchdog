class VenuesController < ApplicationController
  
  def index
    @venues = Venue.all 
  end
  
  def new
     @venue = Venue.new
  end
  
  def create
    @venue = Venue.new(venue_params)
    
    if @venue.save
      flash[:success] = "Venue has been created successfully!"
      redirect_to venues_path
    else
      render 'new'
    end
  end
  
  def edit
     @venue = Venue.find(params[:id])
  end
  
  def update
    @venue = Venue.find(params[:id])
    
    if @venue.update(Venue_params)
      flash[:success] = "Venue has been updated successfully!"
      redirect_to venues_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @venue = Venue.find(params[:id])
      @venue.destroy
      redirect_to venues_path
  end
  
  private
    def venue_params
      params.require(:venue).permit(:name)
    end

end