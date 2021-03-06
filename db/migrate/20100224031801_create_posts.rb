class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :feed_id
      t.boolean :read, :default => false
      t.string :url
      t.string :title
      t.text :content
      t.datetime :post_dt
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
