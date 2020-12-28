class AddAvatarToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :avatar, :string
  end
end
