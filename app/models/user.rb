class User < ActiveRecord::Base
  acts_as_authentic
  
  has_one :person
  has_many :feeds
end
