class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string     :name
      t.text       :description
      t.decimal    :price, precision: 10, scale: 2
      t.references :productable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
