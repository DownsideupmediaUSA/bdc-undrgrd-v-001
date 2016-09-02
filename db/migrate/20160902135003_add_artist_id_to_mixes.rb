class AddArtistIdToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :artist_id, :integer
  end
end
