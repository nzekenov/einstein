class Deleteadmin < ActiveRecord::Migration[5.1]
  def change
    remove_column :authors, :admin

  end
end
