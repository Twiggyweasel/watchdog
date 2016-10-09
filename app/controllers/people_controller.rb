class PeopleController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
   def index
       @filterrific = initialize_filterrific(
            Person,
            params[:filterrific],
            select_options: {
            sorted_by: Person.options_for_sorted_by,
            with_archive_status: Person.options_for_archived
            }
        ) or return
        @people = @filterrific.find.page(params[:page])

        
        respond_to do |format|
            format.html
            format.js
        end
        #@people = Person.paginate(page: params[:page], per_page: 5)
   end
    
    def self.search(search, page)
    paginate :per_page => 5, :page => page,
           :conditions => ['name like ?', "%#{search}%"], :order => 'name'
    end   
   
   def show
        @person = Person.find(params[:id])
        @versions = @person.versions.first  
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
      params.require(:person).permit(:name, :image, :age, :height, :weight, :gender, :reason_short, :reason_detailed, :wearing, :cfa, :contact, :archived, :incident_id)
    end
end