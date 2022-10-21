class Solution < ApplicationRecord
    belongs_to :user
    # belongs_to :question
    validates :user_id,:description, presence: true
end
