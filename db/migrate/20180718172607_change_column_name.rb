class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :lessons, :pulished_at, :published_at
  end
end
