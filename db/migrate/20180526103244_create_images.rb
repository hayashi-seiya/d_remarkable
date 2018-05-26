class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :type, null: false, comment: "どの写真か(attraction, show, restaurant)"
      t.integer :type_id, null: false, comment: "type.id"
      t.string :name, null: false

      t.timestamps
    end
  end
end
