class AddBannerImageUrlToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :banner_image_url, :string
  end
end
