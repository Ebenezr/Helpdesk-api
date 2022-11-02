class SolutionNotificationsController < ApplicationController
  before_action :set_solution_notification, only: %i[ show update destroy ]

  # GET /solution_notifications
  def index
    @solution_notifications = SolutionNotification.all

    render json: @solution_notifications
  end

  # GET /solution_notifications/1
  def show
    render json: @solution_notification
  end

  # POST /solution_notifications
  def create
    @solution_notification = SolutionNotification.new(solution_notification_params)

    if @solution_notification.save
      render json: @solution_notification, status: :created, location: @solution_notification
    else
      render json: @solution_notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solution_notifications/1
  def update
    if @solution_notification.update(solution_notification_params)
      render json: @solution_notification
    else
      render json: @solution_notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solution_notifications/1
  def destroy
    @solution_notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution_notification
      @solution_notification = SolutionNotification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solution_notification_params
      params.require(:solution_notification).permit(:user_id, :question_id, :solution_id)
    end
end
