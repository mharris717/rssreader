class Post < ActiveRecord::Base
  belongs_to :feed
  validates_uniqueness_of :url, :scope => :feed_id
  validates_presence_of :url, :content, :title, :post_dt #is it possible that a valid fed item might not have these elements?
  named_scope :unread, :conditions => {:read => false}
end
