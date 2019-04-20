class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :checkins, :dependent => :destroy
  
end
