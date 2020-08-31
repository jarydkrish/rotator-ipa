class AddUnsplashImageUrlToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :unsplash_image_url, :string
  end
end
