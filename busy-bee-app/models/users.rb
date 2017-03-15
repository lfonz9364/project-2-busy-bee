class User < ActiveRecord::Base
  belongs_to :developer
  belongs_to :requester
end
