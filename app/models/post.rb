class Post < ActiveRecord::Base
  belongs_to :feed
  validates_uniqueness_of :url, :scope => :feed_id
  validates_presence_of :url, :content, :title, :post_dt #is it possible that a valid fed item might not have these elements?
  named_scope :unread, :conditions => {:read => false}
  def load_from_feed_item(item)
    update_attributes(attr_hash(item))
  end
  def attr_hash(item)
    content = item.content || item.description
    dt = item.dc_date || item.published || item.pubDate
    raise [content.class,dt.class,url,item.keys].inspect + item.inspect if content.blank? or dt.blank?
    {:url => item.link, :title => item.title, :content => content, :post_dt => dt}
  end
end
