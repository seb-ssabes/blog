class AddPublishedAtToBlogposts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogposts, :published_at, :datetime
  end
end
