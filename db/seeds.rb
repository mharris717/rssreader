# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

u = User.find_or_create_by_email(:email => 'mharris717@gmail.com', :password => 'password', :password_confirmation => 'password')
u.save!
u.feeds.create!(:url => 'http://feeds.feedburner.com/AlineaAtHome')
u.feeds.create!(:url => 'http://daringfireball.net/index.xml')
u.feeds.create!(:url => 'http://feeds.feedburner.com/RyansScraps')
u.feeds.create!(:url => 'http://thechangelog.com/rss')

u = User.find_or_create_by_email(:email => 'stevie@animoto.com', :password => 'password', :password_confirmation => 'password')
u.save!
u.feeds.create!(:url => 'http://daringfireball.net/index.xml')
u.feeds.create!(:url => 'http://feeds.feedburner.com/RyansScraps')
u.feeds.create!(:url => 'http://thechangelog.com/rss')

Feed.all.each { |x| x.load_feed! }