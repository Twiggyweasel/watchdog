class PeopleController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
   def index
        @people = Person.all
   end
   
   def show
        @person = Person.find(params[:id])
   end
   
   def new
       @person = Person.new
   end
   
   def create
         @person = Person.new(people_params)
    if @person.save
      #do something
      #flash[:success] = "Your account has been created successfully!"
      redirect_to people_path()
    else
      render 'new'
    end
   end
   
   def edit 
       @person = Person.find(params[:id])
   end
   
   def update
        @person = Person.find(params[:id])
    
    if @person.update(people_params)
      #do
      #flash[:success] = "Your profile has been updated successfully!"
      redirect_to people_path() 
    else
      render 'edit'
    end
   end
   
   def destroy
      @person = Person.find(params[:id])
      @person.destroy
      redirect_to people_path
   end
   
   private 
    def people_params
      params.require(:person).permit(:name, :image, :height, :weight, :gender, :reason_short, :reason_detailed, :cfa, :contact, :archived)
    end
end