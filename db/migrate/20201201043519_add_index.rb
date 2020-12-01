class AddIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :comments, :user_id
    add_index :likes, :problem_id
    add_index :likes, :user_id
  end
end
