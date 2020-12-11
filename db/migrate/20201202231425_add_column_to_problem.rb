class AddColumnToProblem < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :body, :text
  end
end
