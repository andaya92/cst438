class Checkinunique < ActiveRecord::Migration[5.0]
  def change
    add_column :checkins, :day, :date
    add_index :checkins, [:day, :user_id], unique:true
  end
end
