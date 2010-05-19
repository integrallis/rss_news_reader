class AddAuthDataToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :single_access_token, :string
    add_column :users, :perishable_token, :string, :default => ""
    add_column :users, :login_count, :integer, :null => false, :default => 0
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0
    add_column :users, :last_request_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_ip, :string
    add_column :users, :last_login_ip, :string
    add_column :users, :status, :string

    #
    # indexes
    #
    add_index :users, :email
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :perishable_token
  end

  def self.down
    remove_column :users, :crypted_password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :perishable_token
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_request_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip
    remove_column :users, :status
    
    remove_index :users, :email
    remove_index :users, :persistence_token
    remove_index :users, :last_request_at
    remove_index :users, :perishable_token
  end
end
