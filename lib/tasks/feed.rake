namespace :feed do
  task :load_all => :environment do
    Feed.load_all_feeds!
  end
end

task :cron => 'feed:load_all'