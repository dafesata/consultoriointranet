class UsersController < ApplicationController
       before_filter :authenticate_user!
       load_and_authorize_resource      

    def index
        
    end

    def show
      
    end

    def edit
        
    end  
    def destroy
  		User.find(params[:id]).destroy
  		flash[:success] = "Usuario eliminado exitosamente."
  		redirect_to users_admin_index_path
	end
    
   
private

def user_params
  params.require(:user).permit(:username,:numero_id,:nombres,:apellidos,:tipo, :email, :password, :password_confirmation, :remember_me)
end

end
