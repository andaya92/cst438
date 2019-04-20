class AddDateUserIndexa < ActiveRecord::Migration[5.0]
  def change
    add_index :workouts, [:day, :user_id], unique:true 
  end
end
