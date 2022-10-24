class Question < ApplicationRecord

    belongs_to :user
    has_many :solutions
    has_and_belongs_to_many :tags,  join_table: 'questions_tags'

    validates :user_id,:title,:description, presence: true
    
end
