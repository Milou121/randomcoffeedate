class CreateKoffies < ActiveRecord::Migration
  def change
    create_table :koffies do |t|
      t.references :location, index: true, foreign_key: true
      t.integer :sender_id
      t.integer :receiver_id
      t.string :time
      t.date :date
      t.string :sender_status
      t.string :receiver_status

      t.timestamps null: false
    end

    add_foreign_key :koffies, :users, column: :sender_id
    add_foreign_key :koffies, :users, column: :receiver_id

    add_index :koffies, :sender_id
    add_index :koffies, :receiver_id
  end
end
