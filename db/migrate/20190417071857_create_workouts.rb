class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.date :day
      t.string :title
      t.text :workout
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
