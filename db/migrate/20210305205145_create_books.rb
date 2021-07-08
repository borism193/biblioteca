class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :status
      t.datetime :borrowed_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
