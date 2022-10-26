class AuthenticationController < ApplicationController
    # before_action :authorize_request, except: :login

    def login
      # @user = User.find_by_username(params[:username])
      # if @user && @user.authenticate(params[:password])
      #       token = JsonWebToken.encode(user_id: @user.id)
      #       time = Time.now + 24.hours.to_i
      #       render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
      #                username: @user.username, email: @user.email}, status: :ok
      # else
      #   render json: { error: 'Username or password invalid' }, status: :unauthorized
      # end
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
    params.permit(:username, :password)
  end

end
