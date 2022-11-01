class NotificationsController < ApplicationController
    # @notifications = current_user.notifications
    # @notifications.each do |notification|
    #     notification.update_attribute(:read, true)
    # end

    # a notification can be deleted and a user can mark the notification as read:
    def index
        @notifications = @user.notifications
        @notifications.each do |notification|
        notification.update_attribute(:checked, true)
     end
    end

     def destroy
       @notification = Notification.find(params[:id])
       @notification.destroy
       redirect_to :back
     end

    #  delete the notification when a comment is deleted
     def destroy
        @solution = Solution.find(params[:id])
        @notification = Notification.where(:solution_id => @solution.id)
          if @notification.nil?
            @notification.destroy
          end
        @solution.destroy
        redirect_to :back
     end

end
