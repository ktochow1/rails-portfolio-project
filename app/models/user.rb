class User < ActiveRecord::Base
  has_many :lists, through: :project_assignments
  has_many :project_assignments
  has_secure_password
  accepts_nested_attributes_for :lists
  validates :email, presence: true
  scope :most_lists, -> {joins(:project_assignments).where('user_id')}
  # scope :name, -> {where(name: !nil)}



  def self.from_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |user|
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.password = SecureRandom.hex
    end
  end

  def self.names
    group('name').order('count(*)').limit(1).pluck(:name).first
  end






end
