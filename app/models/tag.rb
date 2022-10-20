class Tag < ApplicationRecord
    validates :name, presence:true
    belongs_to :question
end
