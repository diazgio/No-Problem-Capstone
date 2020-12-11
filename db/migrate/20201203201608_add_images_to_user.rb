class AddImagesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cover_image, :string
  end
end
