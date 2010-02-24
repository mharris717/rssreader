class Post < ActiveRecord::Base
  belongs_to :feed
  named_scope :unread, :conditions => {:read => false}
end
