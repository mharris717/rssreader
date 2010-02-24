class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  validates_presence_of :url, :user_id
  validates_uniqueness_of :url, :scope => :user_id
  
  def attr_hash(item)
    content = item.content || item.description
    dt = item.dc_date || item.published
    raise item.inspect if content.blank? or dt.blank?
    {:url => item.link, :title => item.title, :content => content, :post_dt => dt}
  end
  fattr(:rss) { SimpleRSS.parse open(url) }
  def load_feed!
    update_attributes(:title => rss.title)
    rss.items.each do |item|
      posts.find_or_create_by_url(attr_hash(item)).update_attributes(attr_hash(item))
    end
  end
  def self.load_all_feeds!
    all.each { |x| x.load_feed! }
  end
end
