class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
