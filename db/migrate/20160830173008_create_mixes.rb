class CreateMixes < ActiveRecord::Migration
  def up
    create_table :mixes do |t|
      t.string :title
      t.integer :user_id
    end
  end

  def down
    drop_table :mixes
  end
end
