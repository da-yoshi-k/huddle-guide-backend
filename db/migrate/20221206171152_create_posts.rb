class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :workshop, type: :uuid, null: false, foreign_key: true
      t.string :content, null: false
      t.string :type

      t.timestamps
    end
  end
end
