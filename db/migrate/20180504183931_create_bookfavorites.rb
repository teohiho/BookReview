class CreateBookfavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :bookfavorites do |t|

      t.timestamps
    end
  end
end
