class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :website_url
      t.string :unit_no
      t.string :address_1
      t.string :address_2
      t.string :suburb
      t.string :postcode
      t.string :state
      t.text :about
      t.text :services
      t.string :business_type_id

      t.timestamps null: false
    end
  end
end
