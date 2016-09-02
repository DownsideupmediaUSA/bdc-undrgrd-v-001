class AddArtistNameToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :artist_name, :string
  end
end
