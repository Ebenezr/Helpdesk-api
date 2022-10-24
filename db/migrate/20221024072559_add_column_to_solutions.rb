class AddColumnToSolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :solutions, :question_id, :integer
  end
end
