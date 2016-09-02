class RemoveUserInMixes < ActiveRecord::Migration
  def change
    remove_column :mixes, :user_id
  end
end
