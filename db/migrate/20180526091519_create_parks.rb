class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name, null: false
      t.time :business_hours_open, null: false
      t.time :business_hours_close, null: false

      t.timestamps
    end
  end
end
