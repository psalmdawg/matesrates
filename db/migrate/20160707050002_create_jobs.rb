class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :user_id
      t.string :timeframe

      t.timestamps null: false
    end
  end
end
