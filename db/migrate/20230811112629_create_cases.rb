class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.string :case_name,presence: true
      t.string :case_no ,unique: true,presence: true
      t.string :case_description ,presence: true
      t.integer :case_status,presence: true
      t.string :court_name,presence: true
      t.datetime :filing_date ,presence: true
      t.string :case_category,presence: true
      t.string :additional_notes
      t.datetime :Hearing_date,presence: true

      t.references :user , foreign_key: true, null:false

      t.timestamps
    end
  end
end