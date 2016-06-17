class AddCupReferenceToPots < ActiveRecord::Migration
  def change
    add_reference :pots, :cup, index: true, foreign_key: true
  end
end
