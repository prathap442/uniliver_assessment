class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :loginid
      t.text :encrypted_password
      t.text :salt
      t.timestamps
    end
  end
end
