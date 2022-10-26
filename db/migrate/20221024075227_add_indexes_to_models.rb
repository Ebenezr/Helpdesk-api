class AddIndexesToModels < ActiveRecord::Migration[7.0]
  def change
     add_index :questions, :user_id
  end
end
