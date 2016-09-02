class RenameUserTable < ActiveRecord::Migration
  def self.up
    rename_table :users, :artists
  end 
  def self.down
    rename_table :artists, :users
  end
end
