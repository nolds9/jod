class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :year
      t.string :make
      t.string :jet_model
      t.string :serial_number
      t.string :location
      t.string :tags
      t.text :description
      t.string :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
