class Feedback < ActiveRecord::Base
  belongs_to :developer
  belongs_to :requester
  belongs_to :job
end
