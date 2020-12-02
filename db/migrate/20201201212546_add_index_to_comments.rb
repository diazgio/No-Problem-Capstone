class AddIndexToComments < ActiveRecord::Migration[6.0]
  def change
    add_index :comments, :problem_id
  end
end
