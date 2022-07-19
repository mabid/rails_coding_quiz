class CreateTacos < ActiveRecord::Migration[7.0]
  def change
    create_table :tacos do |t|
      t.string :meat
      t.boolean :rice, default: false
      t.boolean :salsa, default: false
      t.boolean :cheese, default: false
      t.text :notes

      t.timestamps
    end
  end
end
