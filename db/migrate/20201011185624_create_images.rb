class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, null: false, foreign_key: true
      t.string :id_unsplash, null: false
      t.string :url, null: false

      t.timestamps
    end

    add_index :images, :id_unsplash, unique: true
    add_index :images, :url, unique: true
  end
end
