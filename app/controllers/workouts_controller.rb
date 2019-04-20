class WorkoutsController < ApplicationController
    
    
    def show
        @workouts = Workout.find_by(user_id: params[:user_id])
        render json: {"workouts"=>@workouts}
    end
    
    def create
        puts "TRYING TO CREATE WORKOUT"
        begin
            @workout = Workout.new(workout_params)
            @workout.save
            
            render json: {"created"=> @workout.nil?}
        rescue Exception => e
            puts e
            render json: {"created"=>false}
        end
    end
    
         
         
    
    private
    
    def workout_params
        params.permit(:user_id, :workout, :day, :title)
    end
        
end
