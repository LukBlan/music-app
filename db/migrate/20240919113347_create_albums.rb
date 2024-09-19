class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :studio, null: false, default: true
      t.timestamps

      t.index :band_id
      t.index :title
    end
  end
end
