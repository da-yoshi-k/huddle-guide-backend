class CreateWorkshops < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :workshops, id: :uuid do |t|
      t.references :team, type: :uuid, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.references :work_step, null: false, foreign_key: true
      t.datetime :work_date
      t.string :facilitator
      t.string :presenter

      t.timestamps
    end
  end
end
