class AddColUsersPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :prefecture, foreign_key: true
  end
end
