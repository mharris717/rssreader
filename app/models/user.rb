class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :feeds
  has_many :posts, :through => :feeds
end