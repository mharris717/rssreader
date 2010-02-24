# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

u = User.find_or_create_by_email(:email => 'mike@strikeinteractive.com', :password => 'password', :password_confirmation => 'password', :confirmed_at => Time.now)
u.save!
u.feeds.create!(:url => 'http://feeds.feedburner.com/AlineaAtHome')
u.feeds.create!(:url => 'http://baseballcrank.com/index.rdf')