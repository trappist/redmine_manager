class AddTeamName < ActiveRecord::Migration
  def self.up
    add_column :users, :team_name, :string
  end
  def self.down
    remove_column :users, :team_name
  end
end

