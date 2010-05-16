class Feed < ActiveRecord::Base
  belongs_to :user
  
  validates_uniqueness_of :title
  validates_presence_of :title, :uri, :title_xpath
  validates_format_of :uri,
                      :message => 'invalid feed uri',
                      :allow_nil => false,
                      :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  
  def self.published_feeds
    Feed.find(:all, :conditions => {:published => true})
  end
end
