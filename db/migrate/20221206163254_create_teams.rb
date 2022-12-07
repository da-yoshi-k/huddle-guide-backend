class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :teams, id: :uuid do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
