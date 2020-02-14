class User < ActiveRecord::Base
  has_many :lists, through: :project_assignments
  has_secure_password
  accepts_nested_attributes_for :lists
  # accepts_nested_attributes_for :project_assignments
  validates :username, presence: true
  # validates :password_digest, presence: true
  # accepts_nested_attributes_for
end
