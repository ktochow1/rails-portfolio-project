class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists
  has_secure_password
  accepts_nested_attributes_for :lists
  validates :username, presence: true
  validates :password_digest, presence: true
  # accepts_nested_attributes_for
end
