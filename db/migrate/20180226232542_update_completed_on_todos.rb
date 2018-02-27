class UpdateCompletedOnTodos < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :complete, :completed
  end
end
