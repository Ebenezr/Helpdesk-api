class Question < ApplicationRecord

    belongs_to :user
    has_many :solutions
    has_many :bookmarks
    has_many :users, through: :bookmarks
    validates :user_id,:title,:description, presence: true
    
end
