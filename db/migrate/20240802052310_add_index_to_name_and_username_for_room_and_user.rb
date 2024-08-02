class AddIndexToNameAndUsernameForRoomAndUser < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :username, unique: true
    add_index :rooms, :name, unique: true
  end
end
