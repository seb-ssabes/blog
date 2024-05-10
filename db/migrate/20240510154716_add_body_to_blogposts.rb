class AddBodyToBlogposts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogposts, :body, :text
  end
end
