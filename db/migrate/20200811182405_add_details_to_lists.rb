class AddDetailsToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :description, :string
    add_column :lists, :due_date, :integer
  end
end
