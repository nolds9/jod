class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name

      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :details, :listings
  end
end
