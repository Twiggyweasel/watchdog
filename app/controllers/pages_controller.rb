class PagesController < ApplicationController
    def index
        
    end
    
    def day_display
        @people = Person.where("created_at >= ?", Date.today)
    end
    
    def history_display
        @people = Person.all
    end
end