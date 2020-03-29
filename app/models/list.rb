class List < ActiveRecord::Base
  has_many :users, through: :project_assignments
  has_many :project_assignments
  has_many :tasks
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :tasks
  validates_presence_of :title
  validates_presence_of :status

  # 
  # def lists=(lists_hashes)
  #   lists_hashes.each do |i, lists_hashes|
  #     list = List.find_or_create_by(title: lists_hashes[:title])
  #     self.project_assignments.build(:list => list)
  #   end
  # end
end
