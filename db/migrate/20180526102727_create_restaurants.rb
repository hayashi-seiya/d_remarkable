class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.references :park, foreign_key: true
      t.string :name, null: false
      t.time :business_hours_open
      t.time :business_hours_close

      t.timestamps
    end
  end
end
