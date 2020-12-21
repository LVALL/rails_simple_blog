class ChangeViewsCounterInPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :views_counter, :integer, default: 0
    add_column :posts, :views_counter, :integer
  end
end
