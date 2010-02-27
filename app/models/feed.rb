class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :posts, :order => 'post_dt desc'
  validates_presence_of :url, :user_id
  validates_uniqueness_of :url, :scope => :user_id

  fattr(:rss) { SimpleRSS.parse open( (url||'').strip ) }
  def load_feed!
    raise rss.inspect unless rss.title.present?
    update_attributes(:title => rss.title)
    
    rss.items.each do |item|
      posts.find_or_create_by_url(item.url).load_from_feed_item(item)
    end
  end
  def self.load_all_feeds!
    all.each { |x| x.load_feed! }
  end
end
