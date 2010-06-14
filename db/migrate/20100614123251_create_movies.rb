class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.integer :duration
      t.string :directed_by
      t.string :cast
      t.string :genre
      t.string :plot
      t.string :poster_url
      t.int :imdbid
      t.integer :user_id
      t.integer :media_id
      t.string :loaned_to
      t.timestamps
    end
  end
  
  def self.down
    drop_table :movies
  end
end
