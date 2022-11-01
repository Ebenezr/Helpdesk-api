class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|

    t.integer :solution_id
    t.integer :question_id
    t.integer :user_id


      t.timestamps
    end
  end
end
