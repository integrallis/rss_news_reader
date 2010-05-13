class AddPublishedToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :published, :boolean
  end

  def self.down
    remove_column :feeds, :published
  end
end
