class Organization < ActiveRecord::Base
  has_secure_password
  
  has_many :questions
  has_many :surveys, dependent: :destroy
  has_many :teams, dependent: :destroy
end
