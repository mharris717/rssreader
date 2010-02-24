class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  def load_feed!
    rss = SimpleRSS.parse open(url)
    update_attributes(:title => rss.title)
    rss.items.each do |item|
      content = item.content || item.description
      raise item.inspect if content.blank?
      p = posts.find_or_create_by_url(:url => item.link, :title => item.title, :content => content)
      p.update_attributes(:url => item.link, :title => item.title, :content => content)
    end
  end
end
