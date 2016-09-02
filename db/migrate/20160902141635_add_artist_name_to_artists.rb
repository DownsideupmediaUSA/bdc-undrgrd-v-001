class AddArtistNameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :artist_name, :string
  end
end
