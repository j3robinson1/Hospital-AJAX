class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :name
      t.text :direction
      t.integer :patient_id
      t.timestamps null: false
    end
  end
end
