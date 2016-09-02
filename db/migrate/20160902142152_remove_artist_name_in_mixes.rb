class RemoveArtistNameInMixes < ActiveRecord::Migration
  def change
    remove_column :mixes, :artist_name
  end
end
