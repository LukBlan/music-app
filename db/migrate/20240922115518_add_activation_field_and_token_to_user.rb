class AddActivationFieldAndTokenToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :activated, :boolean
    add_column :users, :activation_token, :string
  end
end
