class RemoveAuthorNameFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :author_name
  end
end
