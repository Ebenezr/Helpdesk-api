class AddReadColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :solution_notifications, :read, :boolean
  end
end
