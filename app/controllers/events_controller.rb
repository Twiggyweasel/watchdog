class EventsController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
   def index
       @filterrific = initialize_filterrific(
            Event,
            params[:filterrific],
            select_options: {
            sorted_by: Event.options_for_sorted_by,
            # with_deptartment_id: Department.options_for_select,
            # with_clearance_id: Clearance.options_for_select
            }
        ) or return
        @events = @filterrific.find.page(params[:page])
        #@users = User.paginate(page: params[:page], per_page: 5)
        
        respond_to do |format|
            format.html
            format.js
        end
        # @events = Event.all
   end
   
   def show
        @events = Event.find(params[:id])
   end
   
   def new
       @events = Event.new
   end
   
   def create
         @events = Event.new(event_params)
    if @events.save
      #do something
      #flash[:success] = "Your account has been created successfully!"
      redirect_to events_path()
    else
      render 'new'
    end
   end
   
   def edit 
       @events = Event.find(params[:id])
   end
   
   def update
        @events = Event.find(params[:id])
    
    if @events.update(event_params)
      #do
      #flash[:success] = "Your profile has been updated successfully!"
      redirect_to events_path() 
    else
      render 'edit'
    end
   end
   
   def destroy
      @events = Event.find(params[:id])
      @events.destroy
      redirect_to events_path
   end
   
   private 
    def event_params
      params.require(:event).permit(:id, :name, :location, :event_type, :time, :details, :date)
    end
end