class CreateAuthorCommentVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :author_comment_votes do |t|
      t.column :vote_value, :integer
      t.timestamps
    end
  end
end
