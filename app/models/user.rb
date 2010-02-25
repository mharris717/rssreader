class User < ActiveRecord::Base
  devise :authenticatable, :rememberable, :validatable, :registerable
  has_many :feeds, :order => 'title asc'
  has_many :posts, :through => :feeds
  def load_all_feeds!
    feeds.sort_by { |x| x.posts.size }.each { |x| x.load_feed! }
  end
end