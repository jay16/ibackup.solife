class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.integer :phone_id
      t.integer :id_id
      t.string :number
      t.string :name
      t.string :date
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
