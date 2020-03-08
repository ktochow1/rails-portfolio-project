class User < ActiveRecord::Base
  has_many :lists, through: :project_assignments
  has_many :project_assignments
  has_secure_password
  accepts_nested_attributes_for :lists
  # accepts_nested_attributes_for :project_assignments
  validates :email, presence: true

  def self.from_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |user|
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.password = SecureRandom.hex
    end
  end

end
