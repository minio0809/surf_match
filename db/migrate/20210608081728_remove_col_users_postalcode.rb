class RemoveColUsersPostalcode < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :postal_code
  end
end
