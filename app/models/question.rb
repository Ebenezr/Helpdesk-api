class Question < ApplicationRecord

    belongs_to :user
    has_many :answers

    validates :user_id,:title,:description, presence: true
    
end
