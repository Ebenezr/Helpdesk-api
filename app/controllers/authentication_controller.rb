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

      # actions to help user reset password
  def resetpassword
        @user = User.find_by_email(user_params[:email]) 

        if @user && @user.update!(user_params)
            render json: @user, status: :ok
        else
            render json: {error:"Account not found! try creating new one"}, status: :not_found
        end    
  end

  private

  def user_params
    params.permit(:email,:username, :password)
  end

  

end
