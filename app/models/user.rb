class User < ActiveRecord::Base 
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :lists 
  has_many :tasks, through: :lists
end 