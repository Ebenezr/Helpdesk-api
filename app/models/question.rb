class Question < ApplicationRecord

    belongs_to :user
    has_many :solutions
<<<<<<< HEAD
    has_many :bookmarks
    has_many :users, through: :bookmarks
=======
    has_and_belongs_to_many :tags,  join_table: 'questions_tags'

>>>>>>> origin/dev
    validates :user_id,:title,:description, presence: true
    
end
