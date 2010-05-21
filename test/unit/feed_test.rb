require 'test_helper'

class FeedTest < ActiveSupport::TestCase

  test "that a properly constructed feed is valid" do
    feed = create_feed
    assert feed.valid?
  end

  test "that a feed requires a title" do
    feed = create_feed(:title => nil)
    assert !feed.valid?
  end

  test "that a feed requires a well formed uri" do
    feed = create_feed(:uri => 'httb:://baduri.com/badfeed.xml')
    assert !feed.valid?
  end

  protected
    def create_feed(overridden_options = {})
      options = {
        :title => "Any Title",
        :uri => feeds(:bbc).uri,
        :title_xpath => feeds(:bbc).title_xpath
      }.merge(overridden_options)

      Feed.new(options)
    end
end
