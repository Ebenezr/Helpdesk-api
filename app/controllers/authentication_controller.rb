class AuthenticationController < ApplicationController
    # before_action :authorize_request, except: :login

    def login
      @user = User.find_by_username(params[:username])
      if @user && @user.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username, email: @user.email}, status: :ok
      else
        render json: { error: 'Username or password invalid' }, status: :unauthorized
      end
    end

  private

  def login_params
    params.permit(:username, :password)
  end

end
