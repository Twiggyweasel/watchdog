class Person < ActiveRecord::Base
    belongs_to :incident
    mount_uploader :image, ImageUploader
    
    #sets limit on number of records for will_paginate
    self.per_page = 5
    
    
    #Creates Filterrific reference for Person Record
    filterrific(
    default_filter_params: { sorted_by: 'created_at_asc' },
        available_filters: [
            :sorted_by,
            :search_query,
            :with_archive_status
        ]
    )
    
    #define sort params
    scope :sorted_by, lambda { |sort_option|
        # extract the sort direction from the param value.
        direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
        case sort_option.to_s
        when /^created_at_/
            # Simple sort on the created_at column.
            # Make sure to include the table name to avoid ambiguous column names.
            # Joining on other tables is quite common in Filterrific, and almost
            # every ActiveRecord table has a 'created_at' column.
            order("people.created_at #{ direction }")
        when /^name_/
        # Simple sort on the name colums
            order("people.name #{ direction}")
        when /^archived_/
            
            order("people.archived #{ direction}")
        else
            raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
        end
    }
    
    scope :with_archive_status, lambda { |archived|
        where(archived: [*archived])
    }
    
    #define search params
    scope :search_query, lambda { |query|
        # Searches the students table on the 'first_name' and 'last_name' columns.
        # Matches using LIKE, automatically appends '%' to each term.
        # LIKE is case INsensitive with MySQL, however it is case
        # sensitive with PostGreSQL. To make it work in both worlds,
        # we downcase everything.
        return nil  if query.blank?
        
        # condition query, parse into individual keywords
        terms = query.downcase.split(/\s+/)
        
        # replace "*" with "%" for wildcard searches,
        # append '%', remove duplicate '%'s
        terms = terms.map { |e|
        (e.gsub('*', '%') + '%').gsub(/%+/, '%')
        }
        # configure number of OR conditions for provision
        # of interpolation arguments. Adjust this if you
        # change the number of OR conditions.
        num_or_conds = 1
        where(
        terms.map { |term|
            "(LOWER(people.name) LIKE ?)"
        }.join(' AND '),
            *terms.map { |e| [e] * num_or_conds }.flatten
        )
    }
    
    def self.options_for_sorted_by
        [
            ['Name (a-z)', 'name_asc'],
            ['Name (z-a)', 'name_desc'],
            ['Creation date (newest first)', 'created_at_desc'],
            ['Creation date (oldest first)', 'created_at_asc'],
            ['Archived (newest first)', 'archived_desc'],
            ['Archived date (oldest first)', 'archived_asc'],
        ]
    end
    
    def self.options_for_archived
        [
            ['Archived', 't'],
            ['Not Archived', 'f']
        ]
    end
end