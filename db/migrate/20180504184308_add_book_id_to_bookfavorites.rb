class AddBookIdToBookfavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :bookfavorites, :book_id, :integer
  end
end
