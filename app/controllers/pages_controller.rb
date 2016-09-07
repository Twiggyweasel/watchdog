class PagesController < ApplicationController

before_action :require_user
    
    def index
        
    end
    
    def active
        @people = Person.where(archived: [false, nil])
    end
    
    def archive
        @people = Person.where(archived: [true])
    end
    
 
end