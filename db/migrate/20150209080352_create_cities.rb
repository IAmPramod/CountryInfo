class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.decimal :area
      t.references :state, index: true

      t.timestamps null: false
    end
  end
end
