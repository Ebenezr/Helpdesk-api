class AuthenticationController < ApplicationController
    # before_action :authorize_request, except: :login

    # Login action
    def login
          @user = User.find_by_username(user_params[:username]) 

        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error:"Invalid Email or password"}, status: :unauthorized
        end    
    end


  private

  def user_params
    params.permit(:email,:username, :password)
  end

  

end
