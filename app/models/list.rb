class List < ActiveRecord::Base
  has_many :users, through: :project_assignments
  has_many :lists
  accepts_nested_attributes_for :users
  validates_presence_of :title
  validates_presence_of :status

end
