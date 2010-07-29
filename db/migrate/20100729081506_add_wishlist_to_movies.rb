class AddWishlistToMovies < ActiveRecord::Migration
  def self.up
  	add_column :movies, :wishlist, :boolean
  end

  def self.down
  	remove_column :movies, :wishlist
  end
end
