class CreateRequires < ActiveRecord::Migration[5.1]
  def change
    create_table :requires do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :user_id
      t.string :comment

      t.timestamps
    end
  end
end
