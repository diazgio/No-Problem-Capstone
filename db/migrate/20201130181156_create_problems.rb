class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end

    add_index :problems, :user_id
  end
end
