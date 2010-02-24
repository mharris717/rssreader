class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :feeds
  has_many :posts, :through => :feeds
  def load_all_feeds!
    feeds.sort_by { |x| x.posts.size }.each { |x| x.load_feed! }
  end
end