class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :duration, :directed_by, :cast, :genre, :plot, :poster_url, :imdbid, :user_id, :media_id, :loaned_to
end
