class AddAuthorIdToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :author_id, :integer
    add_index :lessons, :author_id
  end
end
