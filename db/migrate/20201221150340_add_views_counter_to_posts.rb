class AddViewsCounterToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :views_counter, :integer, default: 0
  end
end
