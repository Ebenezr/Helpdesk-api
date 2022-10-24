class AddIndexesToSolutions < ActiveRecord::Migration[7.0]
  def change
     add_index :solutions, :user_id
      add_index :solutions, :question_id
  end
end
