class RemoveColUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :phone
    remove_column :users, :address
  end
end
