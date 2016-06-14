class CreatePotFriends < ActiveRecord::Migration
  def change
    create_table :pot_friends do |t|
      t.references :pot, index: true, foreign_key: true
      t.integer :friend_id

      t.timestamps null: false
    end

    add_foreign_key :pot_friends, :users, column: :friend_id
    add_index :pot_friends, :friend_id
  end
end
