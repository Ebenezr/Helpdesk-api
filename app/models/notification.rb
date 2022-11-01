class Notification < ApplicationRecord
    belongs_to :question
    belongs_to :solution
    belongs_to :user
end
