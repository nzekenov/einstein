class AddPublishedToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :published, :boolean, default: false
    add_column :lessons, :pulished_at, :datetime
  end
end
