class CreateSolutionNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :solution_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :solution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
