class CheckinsController < ApplicationController
    def new 
        @users = User.all
        @checkin = Checkin.new 
    end
    
    def create
        puts "Create checkin here"
        @users = User.all
        
        @checkin = Checkin.new
        @checkin.user_id = params[:checkin][:user_id]
        @checkin.day = Date.today()
        begin
        @checkin.save
        puts @checkin.errors.full_messages
        redirect_to "/users/%s/"%[params['checkin']['user_id']]
        rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            @checkin_error = "Error checking in, user already checked in today"
            render template: "/checkins/new/"
        end
    
        
    end
    
    def index
        @checkins = Checkin.where "day" => DateTime.current()
        puts @checkins
    end
    
    
    private
    
    # use callbacks to share common setup or constraints between actions
    def get_user(req)
        @user = User.find(req['id'])
    end 
    
    
    def checkin_params
        params.require(:checkin).permit(:user_id)
    end 

end
