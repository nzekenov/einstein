class AddAdministratorToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :admin, :boolean, default: false
  end
end
