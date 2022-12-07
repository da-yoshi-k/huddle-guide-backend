class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.integer :reaction_type, null: false

      t.timestamps
    end
  end
end
