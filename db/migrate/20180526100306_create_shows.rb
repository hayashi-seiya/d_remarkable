class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.references :park, foreign_key: true
      t.string :name, null: false
      t.integer :duration_time, comment: "所要時間"
      t.integer :waiting_time, comment: "待ち時間"
      t.time :business_hours_open
      t.time :business_hours_close

      t.timestamps
    end
  end
end
