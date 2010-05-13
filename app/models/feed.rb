class Feed < ActiveRecord::Base
  def self.published_feeds
    Feed.find(:all, :conditions => {:published => true})
  end
end
