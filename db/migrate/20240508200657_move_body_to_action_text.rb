class MoveBodyToActionText < ActiveRecord::Migration[7.1]
  def change
    Blogpost.find_each do |blogpost|
      blogpost.update(content: blogpost.body)
    end
    remove_column :blogposts, :body
  end
end
