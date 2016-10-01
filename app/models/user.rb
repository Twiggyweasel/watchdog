class User < ActiveRecord::Base
    has_secure_password
    belongs_to :clearance
    belongs_to :department
    
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
            order("users.created_at #{ direction }")
        when /^name_/
        # Simple sort on the name colums
            order("users.first_name #{ direction}")
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
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(users.first_name) LIKE ? OR LOWER(users.last_name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
}
    
    scope :with_deptartment_id, lambda { |department_ids|
        where(department_id: [*department_ids])
    }
    
        scope :with_clearance_id, lambda { |clearance_ids|
        where(clearance_id: [*clearance_ids])
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