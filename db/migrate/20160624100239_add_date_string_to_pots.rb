class AddDateStringToPots < ActiveRecord::Migration
  def change
    add_column :pots, :datestring, :string
  end
end
