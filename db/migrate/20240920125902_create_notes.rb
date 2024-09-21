class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.integer :user_id, null: false
      t.integer :track_id, null: false
      t.text :note, null: false
      t.timestamps

      t.index :user_id
      t.index :track_id
    end
  end
end
