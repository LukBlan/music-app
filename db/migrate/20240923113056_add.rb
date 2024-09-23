class Add < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin, :boolean, default: false
    User.update_all(admin: false)
    change_column_null :users, :admin, false
  end
end
