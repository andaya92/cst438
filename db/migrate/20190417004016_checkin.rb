class Checkin < ActiveRecord::Migration[5.0]
  def change
    remove_column :checkins, :checkindate
    remove_column :checkins, :checkints
  end
end
