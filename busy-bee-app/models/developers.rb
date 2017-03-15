class Developer < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :feedbacks
end
