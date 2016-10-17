class AddLocationDetailstoJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :street_number, :string
    add_column :jobs, :street, :string
    add_column :jobs, :suburb, :string
    add_column :jobs, :state,  :string
    add_column :jobs, :postcode, :string
    add_column :jobs, :country, :string
    add_column :jobs, :lat, :string
    add_column :jobs, :long, :string

  end
end
