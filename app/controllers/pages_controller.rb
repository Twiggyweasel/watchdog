class PagesController < ApplicationController
require 'will_paginate/array' 

before_action :require_user
    
    def index
        
    end
    
    def active
        @people = Person.where(archived: [false, nil]);
    end
    
    def archive
        @people = Person.where(archived: [true]);
    end
    
    def directory
        @department = Department.all
        @listing = Listing.all;
    end
    
    def security
        @constructions = Construction.paginate(:page => params[:page], :per_page => 5)
        @events = Event.where("DATE(date) = ?", Date.today)
        @tips = Tip.all
    end
 
end