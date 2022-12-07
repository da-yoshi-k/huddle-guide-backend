class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
