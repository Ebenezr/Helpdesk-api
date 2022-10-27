class QuestionsTag < ApplicationRecord
  belongs_to :question
  belongs_to :tag
  belongs_to :user
end
