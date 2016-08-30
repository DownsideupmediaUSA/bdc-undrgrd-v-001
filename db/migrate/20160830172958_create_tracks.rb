class CreateTracks < ActiveRecord::Migration
  def up
    create_table :tracks do |t|
      t.string :title
      t.integer :user_id
    end
  end

  def down
    drop_table :tracks
  end
end
