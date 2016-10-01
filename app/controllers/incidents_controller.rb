class IncidentsController < ApplicationController
  
  def index
    @incidents = Incident.all 
  end
  
  def new
     @incident = Incident.new
  end
  
  def create
    @incident = Incident.new(incident_params)
    
    if @incident.save
      flash[:success] = "Clearance has been created successfully!"
      redirect_to incidents_path
    else
      render 'new'
    end
  end
  
  def edit
     @incident = Incident.find(params[:id])
  end
  
  def update
    @incident = Incident.find(params[:id])
    
    if @incident.update(clearance_params)
      flash[:success] = "Incident has been updated successfully!"
      redirect_to incidents_path 
    else
      render 'edit'
    end
  end
  
  def destroy
      @incident = Incident.find(params[:id])
      @incident.destroy
      redirect_to incidents_path
  end
  
  private
    def incident_params
      params.require(:incident).permit(:name)
    end

end