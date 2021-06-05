class AddColumnUsersType < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :board_type, :string
  end
end
