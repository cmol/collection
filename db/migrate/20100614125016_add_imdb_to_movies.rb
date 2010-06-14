class AddImdbToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :imdb, :integer
  end

  def self.down
    remove_column :movies, :imdb
  end
end
