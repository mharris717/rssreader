task :reset => [:environment,:drop_tables,'db:migrate','db:seed']

task :drop_tables => :environment do
  %w(posts feeds users schema_migrations).each { |x| Feed.connection.execute("drop table #{x}") }
end