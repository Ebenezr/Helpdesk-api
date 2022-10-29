class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # validates :question_id, uniqueness: { scope: :user, :message => "has already been bookmarked" }

  # validates :question, uniqueness: true
    #  def bookmarked_by?(user)
    #     return true if bookmarks.any? {|b| b.user == user }
    # end

end
