class Question < ApplicationRecord

    belongs_to :user
    has_many :notifications
    has_many :solutions, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :users, through: :bookmarks
    validates :user_id,:title,:description, presence: true

    # add tags to question
    acts_as_taggable_on :tags

    # order by created date
    default_scope { order("created_at DESC") }
  
 
 
    
end
