class Department < ActiveRecord::Base
   has_many :listing
   has_many :users
   
   def self.options_for_select
      order('LOWER(name)').map { |e| [e.name, e.id] }
   end
end