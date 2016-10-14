class Event < ActiveRecord::Base
    belongs_to :venue
    belongs_to :evetype
    self.per_page = 5
    
    scope :sorted_by, lambda { |sort_option|
        # extract the sort direction from the param value.
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^created_at_/
            # Simple sort on the created_at column.
            # Make sure to include the table name to avoid ambiguous column names.
            # Joining on other tables is quite common in Filterrific, and almost
            # every ActiveRecord table has a 'created_at' column.
            order("events.created_at #{ direction }")
        when /^name_/
        # Simple sort on the name colums
            order("events.first_name #{ direction}")
            #order("LOWER(users.last_name) #{ direction }, LOWER(users.first_name) #{ direction }")
        #when /^department_name_/
        # This sorts by a student's country name, so we need to include
        # the country. We can't use JOIN since not all students might have
        # a country.
         #   order("LOWER(departments.name) #{ direction }").includes(:department)
        else
            raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
        end
    }
    
    filterrific(
        default_filter_params: { sorted_by: 'created_at_asc' },
        available_filters: [
            :sorted_by,
            :search_query,
            :with_deptartment_id,
            :with_clearance_id
        ]
    )
    
    def self.options_for_sorted_by
        [
          ['Name (a-z)', 'name_asc'],
          ['Name (z-a)', 'name_desc'],
          ['Creation date (newest first)', 'created_at_desc'],
          ['Creation date (oldest first)', 'created_at_asc'],
          #['Department (a-z)', 'department_name_asc']
        ]
    end
end