class RolesController < ApplicationController
    def index
        @roles = Role.all
    end
    
    def show
       @role =  set_role
    end
    
    def edit
       @role = set_role
    end
    
    def update
        puts "Editing role"
        @role = set_role
        @role.update(role_params)
        render template: "roles/show"
    end
    
    def new
        @role = Role.new
    end  
    
    def create
        @role = Role.new(role_params)
        if @role.save
            session[:role_id] = @role.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else 
            render "new"
        end  
    end 
    
    def destroy
        @role = set_role
        @role.destroy
    end
    
    private
    
    # use callbacks to share common setup or constraints between actions
    
    def set_role
        @role = Role.find(params[:id])
    end  
    
    def role_params
        params.require(:role).permit(:title)
    end 
end
