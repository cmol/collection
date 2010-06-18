class Media < ActiveRecord::Base
  attr_accessible :name
  has_many :movies
  validates_presence_of :name
end
