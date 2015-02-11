class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :currency
      t.string :timezone

      t.timestamps null: false
    end
  end
end
