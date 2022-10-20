class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # before_action :authorize_request, except: :create
    before_action :find_user, except: [:create, :index]


  # GET /users
  def index
    @users = User.all 
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end


  def update
    @user.update!(user_params)
     render json: @user, status: :accepted
  end

  def destroy
    @user.destroy
    head :no_content
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(
     :username, :first_name, :last_name, :email, :password, :password_confirmation
    )
  end

  def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
  end
  

end

