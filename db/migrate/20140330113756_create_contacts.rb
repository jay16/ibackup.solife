class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :phone_id
      t.string :id_id
      t.string :number
      t.string :name
      t.string :photo
      t.string :type

      t.timestamps
    end
  end
end
