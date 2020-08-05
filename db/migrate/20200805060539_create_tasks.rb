class CreateTasks < ActiveRecord::Migration
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
