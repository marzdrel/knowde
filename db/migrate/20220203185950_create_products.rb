class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
