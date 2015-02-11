class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.decimal :literacy
      t.references :country, index: true

      t.timestamps null: false
    end
  end
end
