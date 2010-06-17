class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :rating, :duration, :directed_by, :cast, :genre, :plot, :poster_url, :imdb, :user_id, :media_id, :loaned_to
  belongs_to :user
  belongs_to :media
end
