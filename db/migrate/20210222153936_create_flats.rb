class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.boolean :available
      t.integer :price
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.references :bear, null: false, foreign_key: true

      t.timestamps
    end
  end
end
