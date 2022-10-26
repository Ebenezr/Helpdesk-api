class AddUserIdToQuestionTags < ActiveRecord::Migration[7.0]
  def change
    add_column :questions_tags, :user_id ,:integer
  end
end
