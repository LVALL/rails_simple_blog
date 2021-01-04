class AddAuthorToAuthorCommentVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :author_comment_votes, :author, index: true
    add_reference :author_comment_votes, :comment, index: true
  end
end
