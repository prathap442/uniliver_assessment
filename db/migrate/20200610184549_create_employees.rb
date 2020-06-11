class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :emp_id
      t.string :name
      t.integer :salary
      t.text :description
      t.integer :age

      t.timestamps
    end
  end
end
