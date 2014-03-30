class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :serial
      t.string :brand
      t.string :host
      t.string :fingerprint
      t.string :manufacturer
      t.string :model
      t.string :incremental
      t.string :product
      t.string :device
      t.string :release

      t.timestamps
    end
  end
end
