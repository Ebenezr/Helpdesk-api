class Solution < ApplicationRecord
    belongs_to :user
    belongs_to :question
    validates :user_id,:description, presence: true

    # order by created date
    default_scope { order("created_at DESC") }
end
