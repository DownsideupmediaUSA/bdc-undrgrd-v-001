class RemoveUserColumn < ActiveRecord::Migration
  def change
    remove_column :tracks, :user_id
  end
end
