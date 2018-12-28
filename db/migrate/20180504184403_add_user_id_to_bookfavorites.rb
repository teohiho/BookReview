class AddUserIdToBookfavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :bookfavorites, :user_id, :integer
  end
end
