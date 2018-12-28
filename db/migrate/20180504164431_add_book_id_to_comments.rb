class AddBookIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :book_id, :integer
  end
end
