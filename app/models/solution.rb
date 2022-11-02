class Solution < ApplicationRecord
    belongs_to :user
    belongs_to :question
    has_many :solution_notifications, dependent: :destroy 
    validates :user_id,:description, presence: true

    # order by created date
    default_scope { order("created_at DESC") }

    after_create :create_notification

private
    def create_notification
        self.solution_notifications.create(
          solution: self,
          question:  self.question,
          user: self.question.user, 
          read: false
        )
     end
end
