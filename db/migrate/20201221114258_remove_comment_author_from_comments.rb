class RemoveCommentAuthorFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :comment_author
  end
end
