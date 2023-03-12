class CreateAdvancements < ActiveRecord::Migration[7.0]
  def change
    create_table :advancements do |t|
      t.string :content, null: false
      t.integer :advancement_type, default: 0, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :workshop, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
