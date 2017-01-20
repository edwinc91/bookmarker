class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.string :type, null: false
      t.string :website
      t.string :volume
      t.string :chapter
      t.string :page
      t.string :description

      t.timestamps null: false
    end

    add_index :books, :type
  end
end
