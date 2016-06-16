class RenameKoffiesToCups < ActiveRecord::Migration
  def change
  	rename_table :koffies, :cups
  end
end
