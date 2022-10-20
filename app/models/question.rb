class Question < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    belongs_to :user
    has_many :answers
    
end
