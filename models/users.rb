class User < ActiveRecord::Base
  has_secure_password
  belongs_to :developer
  belongs_to :requester
  has_many :feedbacks
end
