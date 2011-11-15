class AddManager < ActiveRecord::Migration
  def self.up
    add_column :users, :manager_id, :integer
    add_column :users, :is_manager, :boolean
    add_index :users, :manager_id
  end
  def self.down
    remove_column :users, :manager_id
    remove_column :users, :is_manager
  end
end

