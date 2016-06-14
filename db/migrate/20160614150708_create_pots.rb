class CreatePots < ActiveRecord::Migration
  def change
    create_table :pots do |t|
      t.references :user, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :time_10
      t.boolean :time_12
      t.boolean :time_2
      t.boolean :time_4
      t.boolean :time_6

      t.timestamps null: false
    end
  end
end
