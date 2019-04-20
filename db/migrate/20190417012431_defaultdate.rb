class Defaultdate < ActiveRecord::Migration[5.0]
  def change
    change_column :checkins, :day, :date, default: -> {DateTime.current()}
  end
end
