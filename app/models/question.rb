class Question < ApplicationRecord

    belongs_to :user
    has_many :solutions

    validates :user_id,:title,:description, presence: true
    
end
