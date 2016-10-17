class Removetablesfromjobs < ActiveRecord::Migration
  def change
   remove_column :jobs, :lat, :string
   remove_column :jobs, :long, :string
   add_column :jobs, :longitude, :float
   add_column :jobs, :latitude, :float
 end
end
