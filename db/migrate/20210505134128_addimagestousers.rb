class Addimagestousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :images, :string
  end
end
