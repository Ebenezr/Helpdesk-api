class CreateSolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :solutions do |t|
      t.string :description
      t.integer :votes

      t.timestamps
    end
  end
end
