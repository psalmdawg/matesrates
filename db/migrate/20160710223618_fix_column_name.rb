class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :jobs, :job_type, :job_type_id
  end
end
