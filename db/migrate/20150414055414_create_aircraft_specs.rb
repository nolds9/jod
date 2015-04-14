class CreateAircraftSpecs < ActiveRecord::Migration
  def change
    create_table :aircraft_specs do |t|
      t.string :ask_price
      t.string :verified
      t.string :aftt
      t.string :total_landings
      t.text :engine
      t.text :avionics
      t.string :year_painted
      t.text :exterior
      t.text :interior
      t.text :inspection_status
      t.string :registration
      t.text :condition
      t.string :status

      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :aircraft_specs, :listings
  end
end
