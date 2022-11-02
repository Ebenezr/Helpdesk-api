class SolutionNotification < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :solution
end
