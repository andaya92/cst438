class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.references :user
      t.timestamp :checkints
      t.date :checkindate

      t.timestamps
    end
  end
end
