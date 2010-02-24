require File.join(File.dirname(__FILE__),"..","spec_helper")

describe Feed do
  before do
    @user = User.make
  end
  it 'can add a feed' do
    lambda { @user.feeds.make }.should change(@user.feeds,:count).by(1)
  end
  it 'must have a url' do
    lambda { @user.feeds.make(:url => nil) }.should raise_error
  end
  it 'must have a user' do
    lambda { Feed.make }.should raise_error
  end
  it "can't add same feed twice for a user" do
    @user.feeds.make
    lambda { @user.feeds.make(:url => @user.feeds.first.url) }.should raise_error
  end
  it "can add same feed for different users" do
    @other_user = User.make
    @user.feeds.make
    lambda { @other_user.feeds.make(:url => @user.feeds.first.url) }.should_not raise_error
  end
  context 'feed parsing' do
    fattr(:num_items) { File.open(@file) { |f| f.read.scan(/(<rdf:li|<entry)/).size } }
    fattr(:feed) { @user.feeds.make(:url => @file) }
    it 'can parse rdf' do
      @file = File.expand_path(File.join(RAILS_ROOT,'spec','fixtures',"sample.rdf"))
      lambda { feed.load_feed! }.should change(feed.posts,:count).by(num_items)
    end
    it 'can parse atom' do
      @file = File.expand_path(File.join(RAILS_ROOT,'spec','fixtures',"sample.atom"))
      lambda { feed.load_feed! }.should change(feed.posts,:count).by(num_items)
    end
    it "verify that post data elements are populated correctly"
  end
end