class AddLevelToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :level, :integer, default: 0
  end
end
