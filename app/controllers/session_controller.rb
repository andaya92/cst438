class SessionController < ApplicationController
    
    def auth_member
        begin
            @user = User.find_by(email: params[:email])
            @authenticated = @user.authenticate(params[:password])
            puts "Auth?: %s"%[@authenticated]
            render json: {"authenticated"=> @authenticated != false}
        rescue Exception => e
            puts e
            render json: {"authenticated"=>false}
        end
    
    end
    
    def new
        @user = User.new
    end
    
    def create
     @user = User.find_by(email: params[:user][:email])
     # Login
     puts "Trying to log in as user "
     puts @user.email
     if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      puts "Stored user in session"
      puts @user.id
      redirect_to "/"
     else
      render "new"
     end
    end
    
    def show
       puts "showing"
       
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to "/"
    end
    
end
