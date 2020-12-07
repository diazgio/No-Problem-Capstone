class AddCategoriesToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :category_id, :integer
  end
end
