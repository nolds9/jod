class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :status

      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :specs, :listings
  end
end
