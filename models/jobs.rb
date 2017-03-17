class Job < ActiveRecord::Base
  belongs_to :requester
  belongs_to :developer
  has_many :feedbacks
end
