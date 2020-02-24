class AddProfilePictureToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :profile_picture, :boolean , default: false
  end
end
