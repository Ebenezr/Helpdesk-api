class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :question, uniqueness: true

end
