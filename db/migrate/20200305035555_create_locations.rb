class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key:true, type: :integer
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city,null: false
      t.integer :building_name, null: false
      t.integer :phone_name, null: false
      t.timestamps
    end
  end
end
