class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics, null: true
      t.string :track_type
      t.timestamps

      t.index :album_id
    end
  end
end
