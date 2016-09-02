class RemoveArtistNameInTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :artist_name
  end
end
