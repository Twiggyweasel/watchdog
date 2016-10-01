class ListingsController < ApplicationController
before_action :require_user

  def index
      @department = Department.all
      @listing = Listing.all
  end
  
  def show
      @listing = Listing.find(params[:id])
  end
  
  def new
      @listing = Listing.new
  end
  
  def create
      @listing = Listing.new(listing_params)
  if @listing.save
    #do something
    flash[:success] = "Your entry has been saved!"
    redirect_to listings_path
  else
    render 'new'
  end
  end
      
  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
        @listing = Listing.find(params[:id])
    
   if @listing.update(listing_params)
      #do
      flash[:success] = "Listing has been updated successfully!"
      redirect_to listings_path
   else
      render 'edit'
   end
  end
   
  def destroy
      @listing = Listing.find(params[:id])
      @listing.destroy
      flash[:success] = "Listing has been deleted successfully!"
      redirect_to listings_path
  end
   private 
    def listing_params
      params.require(:listing).permit(:location, :extension, :phone_number, :department_id)
    end
end
