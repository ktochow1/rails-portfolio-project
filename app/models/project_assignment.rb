class ProjectAssignment < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  #join table

end
