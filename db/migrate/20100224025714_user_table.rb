class UserTable < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
       t.authenticatable
       t.confirmable
       t.recoverable
       t.rememberable
       t.trackable
       t.registerable
       t.timestamps
     end
  end

  def self.down
  end
end
