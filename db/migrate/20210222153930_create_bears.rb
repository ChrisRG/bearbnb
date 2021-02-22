class CreateBears < ActiveRecord::Migration[6.0]
  def change
    create_table :bears do |t|
      t.string :name
      t.string :species
      t.text :description

      t.timestamps
    end
  end
end
