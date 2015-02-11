class CreateWikiLinks < ActiveRecord::Migration
  def change
    create_table :wiki_links do |t|
      t.text :url
      t.references :linkable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
