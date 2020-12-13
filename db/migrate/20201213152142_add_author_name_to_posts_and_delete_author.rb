class AddAuthorNameToPostsAndDeleteAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author_name, :string
    remove_column :posts, :author
  end
end
