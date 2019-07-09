class Changedatedue < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :date_due
    add_column :items, :date_due, :date
  end
end
