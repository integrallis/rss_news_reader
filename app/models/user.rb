class User < ActiveRecord::Base
  has_one :person
  has_many :feeds
end
