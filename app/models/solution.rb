class Solution < ApplicationRecord
    belongs_to :user
    belongs_to :question
    has_many :notifications
    validates :user_id,:description, presence: true

    # order by created date
    default_scope { order("created_at DESC") }

  #  after_create :create_notification

private
    # def create_notification
    #     self.notifications.create(
    #       solution: self,
    #       question:  self.question,
    #       user: self.question.user, 
    #       read: false
    #     )
    #  end

    #  def create_notification
    #   @question = Question.find_by(self.question_id)
    #   @solution = Solution.find_by(self.id)
    #   @user = User.find_by(@question.user_id).id
    #     self.notifications.create(
    #       solution: self,
    #       question: self.question,
    #       user:@question.user,
    #       read: false
    #     )
    # end

    # create a notification once a comment is created


    def create_notification
      @question = Question.find_by(self.question_id)
      @user = User.find_by(@question.user_id).id
        Notification.create(
        question_id: self.question_id,
        user_id: @user,
        solution_id: self,
        read: false
         )
   end

end
