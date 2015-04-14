class CreateContactInformation < ActiveRecord::Migration
  def change
    create_table :contact_information do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone_number
      t.string :website
      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
    add_foreign_key :contact_information, :listings
  end
end