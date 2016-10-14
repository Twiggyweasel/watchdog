class PagesController < ApplicationController
require 'will_paginate/array' 

before_action :require_user
    
    def index
        
    end
    
    def active
        @people = Person.where(archived: [false, nil]);
    end
    
    def event
        @events = Event.all
    end
    
    def archive
        @people = Person.where(archived: [true]);
    end
    
    def directory
        @department = Department.all
        @listing = Listing.all;
    end
    
    def security
        @random_pick = rand(Tip.count)
            if @random_pick = 0
                @random_pick = rand(Tip.count)
            else
        end
        @constructions = Construction.paginate(:page => params[:page], :per_page => 5)
        @events = Event.where("DATE(date) = ?", Date.today)
        
        now = Time.now

        @totd = Tip.last
            if @totd.seeded == true
                @totd = Tip.find(@random_pick)
            else
                if @totd.created_at > now - 1.day
                    @totd = Tip.last
                else
                @totd = Tip.find(@random_pick)
                end
            end

    end
 
end