class AddWrokStartTimeAndTurnStartTimeToWorkshops < ActiveRecord::Migration[7.0]
  def change
    add_column :workshops, :work_start_time, :datetime
    add_column :workshops, :turn_start_time, :datetime
  end
end
