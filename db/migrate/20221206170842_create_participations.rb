class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :workshop, type: :uuid, null: false, foreign_key: true
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
