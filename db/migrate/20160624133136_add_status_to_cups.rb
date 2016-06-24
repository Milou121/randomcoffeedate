class AddStatusToCups < ActiveRecord::Migration
  def change
    add_column :cups, :status, :string
    add_column :cups, :canceled_by_id, :integer

    add_foreign_key :cups, :users, column: :canceled_by_id

    add_index :cups, :canceled_by_id
    add_index :cups, :status

    remove_column :cups, :sender_status, :string
    remove_column :cups, :receiver_status, :string
  end
end
