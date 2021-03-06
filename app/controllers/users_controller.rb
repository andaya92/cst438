class UsersController < ApplicationController
    # API for mobile app
    def indexAPI
        render json: {"users"=>index}
    end
    def showAPI
        render json: {"user"=>show}
    end
    
    # List of users
    def index
        @users = User.all
    end
    
    # Empty user object
    def new
        @user = User.new
        @roles = Role.all
    end  
    
    # Creates user; Data sent from form submission from def new 
    def create
        @roles = Role.all
        @user = User.new(user_params)
        begin
            @user.save
            redirect_to root_url, notice: "Thank you for signing up!"   
        rescue Exception => e
            puts e
            @error = "Email already taken"
            render "new"
        end
    end 
    
    #Shows single user
    def show
       @user =  set_user
    end
    
    # Edits single user
    def edit
       @user = set_user
       @roles = Role.all
    end
    
    # Update single user; Data sent from form submisson from def edit
    def update
        @user = set_user
        @user.update(user_params)
        render template: "users/show"
    end
    
    # Delete single user
    def destroy
        @user = get_user(request)
        
        # Require auth
        if is_admin?
            # logged in user cannot deleted themself
            if current_user.id != @user.id
                @del = @user.destroy
                puts "IS deleted?>?>"
                puts @del.destroyed?
                render json: {"deleted" => @del.destroyed?, "status"=> "Deleted user %d"%[request['id']] }.to_json
            else
                render json: {"deleted" => false, "status"=> "Cannot delete self while logged in..." }.to_json
            end
        else
            render json: {"deleted" => false, "status"=> "Admin login required" }.to_json
        end
    end
    
    private
    # use callbacks to share common setup or constraints between actions
    def get_user(req)
        @user = User.find(req['id'])
    end 
    
    def set_user
        @user = User.find(params[:id])
    end  
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role_id)
    end 

end
