class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :details, limit: 50, null: false
      t.string :date_due

      t.timestamps
    end
  end
end
