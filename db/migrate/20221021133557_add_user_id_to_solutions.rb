class AddUserIdToSolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :solutions, :user_id, :integer
  end
end
