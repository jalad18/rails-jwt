class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key:true, null:false

      t.timestamps
    end
  end
end
