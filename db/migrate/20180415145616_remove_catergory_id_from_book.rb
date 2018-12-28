class RemoveCatergoryIdFromBook < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :catergory_id, :integer
  end
end
