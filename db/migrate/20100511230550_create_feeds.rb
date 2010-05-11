class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :title
      t.string :uri
      t.string :title_xpath

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
