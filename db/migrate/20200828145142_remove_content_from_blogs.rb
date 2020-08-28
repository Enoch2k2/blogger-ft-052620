class RemoveContentFromBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :content, :text
  end
end
