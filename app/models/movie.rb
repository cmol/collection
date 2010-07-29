class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :rating, :duration, :directed_by, :cast, :genre, :plot, :poster_url, :imdb, :user_id, :media_id, :loaned_to, :wishlist
  belongs_to :user
  belongs_to :media
  validates_presence_of :title, :media_id, :user_id
end
