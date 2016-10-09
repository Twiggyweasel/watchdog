class AdminController < ApplicationController
before_action :require_user
before_action :require_admin, only: [:new]
    def index
    
    end

    def admin_references
        @clearances = Clearance.all
        @departments = Department.all
        @incidents = Incident.all
        @versions = PaperTrail::Version.paginate(page: params[:page], per_page: 5)
        @hours = Hour.all
    end
end