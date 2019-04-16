class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    
    def show
       @user =  set_user
    end
    
    def edit
       @user = set_user
       @roles = Role.all
    end
    
    def update
        @user = set_user
        @user.update(user_params)
        render template: "users/show"
    end
    
    def new
        @user = User.new
        @roles = Role.all
    end  
    
    def create
        @roles = Role.all
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else 
            render "new"
        end  
    end 
    
    def destroy
        @user = set_user
        @user.destroy
    end
    
    private
    # use callbacks to share common setup or constraints between actions
    def set_user
        @user = User.find(params[:id])
    end  
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role_id)
    end 

end
