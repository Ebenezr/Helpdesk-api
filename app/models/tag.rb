class Tag < ApplicationRecord
    validates :name, presence:true,uniqueness: true
    has_and_belongs_to_many :questions, join_table: 'questions_tags'
end
