class AddDateUserIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :workouts, [:day, :user], unique:true 
  end
end
