class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName
      t.date :dob
      t.text :symptoms
      t.text :gender
      t.text :bloodtype
      t.integer :hospital_id
      t.timestamps null: false
    end
  end
end
