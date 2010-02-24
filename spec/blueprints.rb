require 'machinist/active_record'

User.blueprint do
  email { "#{rand(100000000)}@#{rand(10000000000)}.com" }
  password 'password'
  password_confirmation 'password'
end

Feed.blueprint do
  url { "http://#{rand(1000000000000)}.com/rss"}
end