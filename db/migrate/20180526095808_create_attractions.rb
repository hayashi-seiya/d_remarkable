class CreateAttractions < ActiveRecord::Migration[5.1]
  def change
    create_table :attractions do |t|
      t.references :park, foreign_key: true
      t.string :name, null: false
      t.integer :duration_time, comment: "所要時間"
      t.integer :waiting_time, null: false, comment: "待ち時間"
      t.boolean :fastpass_flag, comment: "ファストパスが発券できるか"
      t.time :business_hours_open
      t.time :business_hours_close

      t.timestamps
    end
  end
end
