class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :stay, :string
    add_column :users, :gender, :string
    add_column :users, :history, :integer
    add_column :users, :homepoint, :string
    add_column :users, :level, :string
    add_column :users, :teach, :string
  end
end
