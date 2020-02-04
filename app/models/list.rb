class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :tasks
  validates_presence_of :title
  validates_presence_of :status

end
