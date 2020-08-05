class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :due_date
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
