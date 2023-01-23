class AddIndexToPosts < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, %i[content user_id workshop_id], unique: true
  end
end
