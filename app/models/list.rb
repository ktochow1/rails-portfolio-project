class List < ActiveRecord::Base
  has_many :users, through: :project_assignments
  has_many :project_assignments
  has_many :tasks
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :tasks
  validates_presence_of :title
  validates_presence_of :status

end
