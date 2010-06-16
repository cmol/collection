class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :active
  acts_as_authentic do |c|
  	c.logged_in_timeout = 30.minutes
  end
  has_many :movies
end
