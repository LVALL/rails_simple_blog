class AddAuthorToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author, :string
    add_reference :posts, :author, index: true
  end
end
