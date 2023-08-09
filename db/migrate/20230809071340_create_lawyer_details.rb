class CreateLawyerDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyer_details do |t|
      t.string :license_no, unique: true
      t.references :user, foreign_key: true, null: false
      t.string :practice_court_name,presence: true
      t.string :practice_field_name,presence: true
      t.string :experience, presence: true
      t.string :city, presence: true
      t.string :consultation_fees, presence: true
      t.timestamps
    end
  end
end